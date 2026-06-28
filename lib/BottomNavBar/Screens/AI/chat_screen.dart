import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref()
      .child('chats')
      .child(userModel.value.studentData!.userId!);
  final BookController bookController = Get.put(BookController());
  final ScrollController _scrollController = ScrollController();

  List<Message> messages = [];
  final TextEditingController _textController = TextEditingController();
  bool isLoading = false;
  double _previousKeyboardHeight = 0;

  File? media;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    _dbRef.orderByChild('timestamp').onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final List<Message> loadedMessages = [];
        data.forEach((key, value) {
          loadedMessages.add(Message.fromJson(value));
        });
        loadedMessages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        setState(() {
          messages = loadedMessages;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      } else {
        setState(() {
          messages = [];
        });
      }
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _sendMessage(String messageText) async {
    final userMessage = Message(
      role: "user",
      content: messageText,
      timestamp: DateTime.now(),
    );

    // Prepare history: up to last 5 messages before the new userMessage
    final int skipCount = messages.length > 5 ? messages.length - 5 : 0;
    List<Map<String, String>> history = messages
        .skip(skipCount)
        .map((msg) => {'role': msg.role, 'content': msg.content})
        .toList();

    // Save to Firebase
    _dbRef.push().set(userMessage.toJson());

    _textController.clear();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        isLoading = true;
      }),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    await bookController.getChatbotMessage(
      message: messageText,
      history: history,
    );

    if (bookController.chatbotModel.value.answer != null) {
      final aiMessage = Message(
        role: "assistant",
        content: bookController.chatbotModel.value.answer!,
        timestamp: DateTime.now(),
      );
      _dbRef.push().set(aiMessage.toJson());
    }

    setState(() {
      isLoading = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return "Today";
    } else if (messageDate == yesterday) {
      return "Yesterday";
    } else {
      return DateFormat('MMMM d, yyyy').format(date);
    }
  }

  Widget _buildDateHeader(DateTime date) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: greyColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _formatDateHeader(date),
          style: TextStyle(
            color: whiteColor.withValues(alpha: 0.6),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardHeight > 0 && _previousKeyboardHeight == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
    _previousKeyboardHeight = keyboardHeight;

    return Scaffold(
      appBar: MyAppbar(title: 'LibGenius', isBack: false),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == messages.length) {
                  return _buildTypingIndicator();
                }

                final message = messages[index];
                bool showDateHeader = false;
                if (index == 0) {
                  showDateHeader = true;
                } else {
                  final prevMessage = messages[index - 1];
                  if (message.timestamp.year != prevMessage.timestamp.year ||
                      message.timestamp.month != prevMessage.timestamp.month ||
                      message.timestamp.day != prevMessage.timestamp.day) {
                    showDateHeader = true;
                  }
                }

                if (showDateHeader) {
                  return Column(
                    children: [
                      _buildDateHeader(message.timestamp),
                      _buildMessage(message),
                    ],
                  );
                }

                return _buildMessage(message);
              },
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    margin: EdgeInsets.only(top: 4, bottom: 5),
                    borderRadius: 25,
                    controller: _textController,
                    hintText: 'Type a Message',
                  ),
                ),
                width(0.02),
                GestureDetector(
                  onTap: () {
                    if (_textController.text.isNotEmpty && !isLoading) {
                      _sendMessage(_textController.text);
                    }
                  },
                  child: Icon(Icons.send, size: 22, color: whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final isSender = message.role == "user";
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isSender
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSender
                  ? mainThemeColor.withValues(alpha: 0.3)
                  : greyColor.withValues(alpha: 0.3),
              border: Border.all(
                color: isSender
                    ? whiteColor.withValues(alpha: 0.3)
                    : whiteColor.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  message.content,
                  style: TextStyle(
                    color: isSender ? whiteColor : whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                height(0.005),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greyColor.withValues(alpha: 0.3),
              border: Border.all(color: whiteColor.withValues(alpha: 0.3)),
            ),
            child: const TypingIndicator(),
          ),
        ],
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final delay = index * 0.2;
            final double animValue =
                (sin((_controller.value * 2 * pi) - (delay * 2 * pi)) + 1) / 2;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3 + (animValue * 0.7)),
                shape: BoxShape.circle,
              ),
            );
          },
        );
      }),
    );
  }
}

class Message {
  final String role;
  final String content;
  final DateTime timestamp;

  Message({required this.role, required this.content, required this.timestamp});

  Map<String, dynamic> toJson() => {
    'role': role,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
  };

  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
    role: json['role'] ?? "user",
    content: json['content'] ?? "",
    timestamp: json['timestamp'] != null
        ? DateTime.parse(json['timestamp'])
        : DateTime.now(),
  );
}
