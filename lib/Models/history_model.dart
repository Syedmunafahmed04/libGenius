// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  final List<History>? history;
  final String? message;
  final int? total;

  HistoryModel({this.history, this.message, this.total});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    history: json["history"] == null
        ? []
        : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "history": history == null
        ? []
        : List<dynamic>.from(history!.map((x) => x.toJson())),
    "message": message,
    "total": total,
  };
}

class History {
  final Book? book;
  final int? bookId;
  final DateTime? dueDate;
  final DateTime? issueDate;
  final int? issueId;
  final String? status;
  final String? userId;

  History({
    this.book,
    this.bookId,
    this.dueDate,
    this.issueDate,
    this.issueId,
    this.status,
    this.userId,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    book: json["book"] == null ? null : Book.fromJson(json["book"]),
    bookId: json["book_id"],
    dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    issueDate: json["issue_date"] == null
        ? null
        : DateTime.parse(json["issue_date"]),
    issueId: json["issue_id"],
    status: json["status"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "book": book?.toJson(),
    "book_id": bookId,
    "due_date":
        "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "issue_date":
        "${issueDate!.year.toString().padLeft(4, '0')}-${issueDate!.month.toString().padLeft(2, '0')}-${issueDate!.day.toString().padLeft(2, '0')}",
    "issue_id": issueId,
    "status": status,
    "user_id": userId,
  };
}

class Book {
  final String? author;
  final String? shelfNo;
  final String? title;

  Book({this.author, this.shelfNo, this.title});

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    author: json["author"],
    shelfNo: json["shelf_no"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "shelf_no": shelfNo,
    "title": title,
  };
}
