// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
    final List<History>? history;
    final String? message;
    final int? total;

    HistoryModel({
        this.history,
        this.message,
        this.total,
    });

    factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
        message: json["message"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
        "message": message,
        "total": total,
    };
}

class History {
    final Book? book;
    final int? bookId;
    final String? cmsId;
    final DateTime? dueDate;
    final Fine? fine;
    final num? fineAmount;
    final int? fineId;
    final num? fineTableAmount;
    final DateTime? issueDate;
    final int? issueId;
    final DateTime? returnDate;
    final String? status;
    final String? userId;

    History({
        this.book,
        this.bookId,
        this.cmsId,
        this.dueDate,
        this.fine,
        this.fineAmount,
        this.fineId,
        this.fineTableAmount,
        this.issueDate,
        this.issueId,
        this.returnDate,
        this.status,
        this.userId,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
        bookId: json["book_id"],
        cmsId: json["cms_id"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        fine: json["fine"] == null ? null : Fine.fromJson(json["fine"]),
        fineAmount: json["fine_amount"],
        fineId: json["fine_id"],
        fineTableAmount: json["fine_table_amount"],
        issueDate: json["issue_date"] == null ? null : DateTime.parse(json["issue_date"]),
        issueId: json["issue_id"],
        returnDate: json["return_date"] == null ? null : DateTime.parse(json["return_date"]),
        status: json["status"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "book": book?.toJson(),
        "book_id": bookId,
        "cms_id": cmsId,
        "due_date": dueDate == null ? null : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "fine": fine?.toJson(),
        "fine_amount": fineAmount,
        "fine_id": fineId,
        "fine_table_amount": fineTableAmount,
        "issue_date": issueDate == null ? null : "${issueDate!.year.toString().padLeft(4, '0')}-${issueDate!.month.toString().padLeft(2, '0')}-${issueDate!.day.toString().padLeft(2, '0')}",
        "issue_id": issueId,
        "return_date": returnDate == null ? null : "${returnDate!.year.toString().padLeft(4, '0')}-${returnDate!.month.toString().padLeft(2, '0')}-${returnDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "user_id": userId,
    };
}

class Book {
    final String? author;
    final String? bookCoverPage;
    final String? shelfNo;
    final String? title;

    Book({
        this.author,
        this.bookCoverPage,
        this.shelfNo,
        this.title,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        author: json["author"],
        bookCoverPage: json["book_cover_page"],
        shelfNo: json["shelf_no"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "book_cover_page": bookCoverPage,
        "shelf_no": shelfNo,
        "title": title,
    };
}

class Fine {
    final int? fineAmount;
    final dynamic fineId;
    final bool? isPaid;

    Fine({
        this.fineAmount,
        this.fineId,
        this.isPaid,
    });

    factory Fine.fromJson(Map<String, dynamic> json) => Fine(
        fineAmount: json["fine_amount"],
        fineId: json["fine_id"],
        isPaid: json["is_paid"],
    );

    Map<String, dynamic> toJson() => {
        "fine_amount": fineAmount,
        "fine_id": fineId,
        "is_paid": isPaid,
    };
}
