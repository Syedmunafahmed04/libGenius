import 'dart:io';
import 'package:flutter/material.dart';
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
  final List<Message> messages = [
    // Add static messages for the person here
    Message(
      sender: "Person",
      content: "I'll text you when I arrive.",

      timestamp: DateTime.now(),
    ),
    Message(sender: "Me", content: "Great!", timestamp: DateTime.now()),

    Message(
      sender: "Person",
      content: "At your address.",

      timestamp: DateTime.now(),
    ),

    Message(
      sender: "Me",
      content: "Wow, that was quick!",

      timestamp: DateTime.now(),
    ),
    Message(sender: "Me", content: "Coming", timestamp: DateTime.now()),
  ];
  final TextEditingController _textController = TextEditingController();

  // final List<Map<String, dynamic>> chats = [
  //   {
  //     'sender': 'person',
  //     'image': 'assets/parcel.png',
  //     'content': "I'm at your door, collect your order",
  //   },

  //   {'sender': 'person', 'content': "Waiting outside.."},

  //   // {'sender': 'me', 'content': "Ok, coming.."},

  //   // {'sender': 'person', 'content': "Thank you.."},
  // ];

  File? media;

  void _sendMessage(String message) {
    setState(() {
      messages.add(
        Message(sender: "Me", content: message, timestamp: DateTime.now()),
      );
    });

    _textController.clear();
  }

  @override
  dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'LibGenius', isBack: false),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessage(message);
              },
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  borderRadius: 25,

                  controller: _textController,
                  hintText: 'Type a Message',
                ),
              ),
              width(0.02),

              GestureDetector(
                onTap: () {
                  if (_textController.text.isEmpty) {
                    _sendMessage(_textController.text);
                  }
                },
                child: Icon(Icons.send, size: 22, color: whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final isSender = message.sender == "Me";
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
              color: isSender ? Color(0xff00DCD2) : whiteColor,
              border: Border.all(color: isSender ? whiteColor : whiteColor),
            ),
            child: Column(
              crossAxisAlignment: isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,

              children: [
                Text(
                  message.content,
                  style: TextStyle(
                    color: isSender ? whiteColor : blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),

                height(0.01),

                Text(
                  "1 day ago",
                  style: TextStyle(
                    color: isSender ? whiteColor : greyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String content;
  final DateTime timestamp;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}
