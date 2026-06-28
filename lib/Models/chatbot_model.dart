// To parse this JSON data, do
//
//     final chatbotModel = chatbotModelFromJson(jsonString);

import 'dart:convert';

ChatbotModel chatbotModelFromJson(String str) => ChatbotModel.fromJson(json.decode(str));

String chatbotModelToJson(ChatbotModel data) => json.encode(data.toJson());

class ChatbotModel {
    final String? answer;
    final List<BooksFound>? booksFound;

    ChatbotModel({
        this.answer,
        this.booksFound,
    });

    factory ChatbotModel.fromJson(Map<String, dynamic> json) => ChatbotModel(
        answer: json["answer"],
        booksFound: json["books_found"] == null ? [] : List<BooksFound>.from(json["books_found"]!.map((x) => BooksFound.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "books_found": booksFound == null ? [] : List<dynamic>.from(booksFound!.map((x) => x.toJson())),
    };
}

class BooksFound {
    final String? author;
    final double? similarity;
    final String? title;

    BooksFound({
        this.author,
        this.similarity,
        this.title,
    });

    factory BooksFound.fromJson(Map<String, dynamic> json) => BooksFound(
        author: json["author"],
        similarity: json["similarity"]?.toDouble(),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "similarity": similarity,
        "title": title,
    };
}
