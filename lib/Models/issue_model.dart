// To parse this JSON data, do
//
//     final issueModel = issueModelFromJson(jsonString);

import 'dart:convert';

IssueModel issueModelFromJson(String str) => IssueModel.fromJson(json.decode(str));

String issueModelToJson(IssueModel data) => json.encode(data.toJson());

class IssueModel {
    final List<IssuedBook>? issuedBooks;
    final String? message;
    final int? total;

    IssueModel({
        this.issuedBooks,
        this.message,
        this.total,
    });

    factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
        issuedBooks: json["issued_books"] == null ? [] : List<IssuedBook>.from(json["issued_books"]!.map((x) => IssuedBook.fromJson(x))),
        message: json["message"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "issued_books": issuedBooks == null ? [] : List<dynamic>.from(issuedBooks!.map((x) => x.toJson())),
        "message": message,
        "total": total,
    };
}

class IssuedBook {
    final Book? book;
    final int? bookId;
    final String? cmsId;
    final DateTime? dueDate;
    final num? fineAmount;
    final int? fineId;
    final num? fineTableAmount;
    final bool? isPaid;
    final DateTime? issueDate;
    final int? issueId;
    final String? status;
    final String? userId;

    IssuedBook({
        this.book,
        this.bookId,
        this.cmsId,
        this.dueDate,
        this.fineAmount,
        this.fineId,
        this.fineTableAmount,
        this.isPaid,
        this.issueDate,
        this.issueId,
        this.status,
        this.userId,
    });

    factory IssuedBook.fromJson(Map<String, dynamic> json) => IssuedBook(
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
        bookId: json["book_id"],
        cmsId: json["cms_id"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        fineAmount: json["fine_amount"],
        fineId: json["fine_id"],
        fineTableAmount: json["fine_table_amount"],
        isPaid: json["is_paid"],
        issueDate: json["issue_date"] == null ? null : DateTime.parse(json["issue_date"]),
        issueId: json["issue_id"],
        status: json["status"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "book": book?.toJson(),
        "book_id": bookId,
        "cms_id": cmsId,
        "due_date": dueDate == null ? null : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "fine_amount": fineAmount,
        "fine_id": fineId,
        "fine_table_amount": fineTableAmount,
        "is_paid": isPaid,
        "issue_date": issueDate == null ? null : "${issueDate!.year.toString().padLeft(4, '0')}-${issueDate!.month.toString().padLeft(2, '0')}-${issueDate!.day.toString().padLeft(2, '0')}",
        "issue_id": issueId,
        "status": status,
        "user_id": userId,
    };
}

class Book {
    final String? author;
    final String? bookCoverPage;
    final int? finePerDay;
    final String? shelfNo;
    final String? title;

    Book({
        this.author,
        this.bookCoverPage,
        this.finePerDay,
        this.shelfNo,
        this.title,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        author: json["author"],
        bookCoverPage: json["book_cover_page"],
        finePerDay: json["fine_per_day"],
        shelfNo: json["shelf_no"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "book_cover_page": bookCoverPage,
        "fine_per_day": finePerDay,
        "shelf_no": shelfNo,
        "title": title,
    };
}
