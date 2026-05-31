// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    final List<Book>? books;
    final String? message;
    final int? total;

    BooksModel({
        this.books,
        this.message,
        this.total,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        books: json["books"] == null ? [] : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
        message: json["message"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "books": books == null ? [] : List<dynamic>.from(books!.map((x) => x.toJson())),
        "message": message,
        "total": total,
    };
}

class Book {
    final String? author;
    final String? bookCoverPage;
    final int? bookId;
    final String? bookPdfUrl;
    final int? categoryId;
    final String? description;
    final String? isbn;
    final String? language;
    final int? publishYear;
    final String? publisherName;
    final int? quantity;
    final List<Review>? review;
    final String? shelfNo;
    final String? status;
    final String? title;

    Book({
        this.author,
        this.bookCoverPage,
        this.bookId,
        this.bookPdfUrl,
        this.categoryId,
        this.description,
        this.isbn,
        this.language,
        this.publishYear,
        this.publisherName,
        this.quantity,
        this.review,
        this.shelfNo,
        this.status,
        this.title,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        author: json["author"],
        bookCoverPage: json["book_cover_page"],
        bookId: json["book_id"],
        bookPdfUrl: json["book_pdf_url"],
        categoryId: json["category_id"],
        description: json["description"],
        isbn: json["isbn"],
        language: json["language"],
        publishYear: json["publish_year"],
        publisherName: json["publisher_name"],
        quantity: json["quantity"],
        review: json["review"] == null ? [] : List<Review>.from(json["review"]!.map((x) => Review.fromJson(x))),
        shelfNo: json["shelf_no"],
        status: json["status"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "book_cover_page": bookCoverPage,
        "book_id": bookId,
        "book_pdf_url": bookPdfUrl,
        "category_id": categoryId,
        "description": description,
        "isbn": isbn,
        "language": language,
        "publish_year": publishYear,
        "publisher_name": publisherName,
        "quantity": quantity,
        "review": review == null ? [] : List<dynamic>.from(review!.map((x) => x.toJson())),
        "shelf_no": shelfNo,
        "status": status,
        "title": title,
    };
}

class Review {
    final int? id;
    final String? ratingDescription;
    final int? ratingStarNumber;
    final Users? users;

    Review({
        this.id,
        this.ratingDescription,
        this.ratingStarNumber,
        this.users,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        ratingDescription: json["rating_description"],
        ratingStarNumber: json["rating_star_number"],
        users: json["users"] == null ? null : Users.fromJson(json["users"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rating_description": ratingDescription,
        "rating_star_number": ratingStarNumber,
        "users": users?.toJson(),
    };
}

class Users {
    final String? cmsId;
    final String? email;
    final String? profilePictureUrl;
    final String? studentName;
    final String? userId;

    Users({
        this.cmsId,
        this.email,
        this.profilePictureUrl,
        this.studentName,
        this.userId,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        cmsId: json["cms_id"],
        email: json["email"],
        profilePictureUrl: json["profile_picture_url"],
        studentName: json["student_name"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "cms_id": cmsId,
        "email": email,
        "profile_picture_url": profilePictureUrl,
        "student_name": studentName,
        "user_id": userId,
    };
}
