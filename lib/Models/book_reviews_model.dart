// To parse this JSON data, do
//
//     final bookReviewsModel = bookReviewsModelFromJson(jsonString);

import 'dart:convert';

import 'package:libgenius/Models/user_model.dart';

BookReviewsModel bookReviewsModelFromJson(String str) => BookReviewsModel.fromJson(json.decode(str));

String bookReviewsModelToJson(BookReviewsModel data) => json.encode(data.toJson());

class BookReviewsModel {
    final double? averageRating;
    final int? bookId;
    final String? bookTitle;
    final String? message;
    final List<Review>? reviews;
    final int? totalReviews;

    BookReviewsModel({
        this.averageRating,
        this.bookId,
        this.bookTitle,
        this.message,
        this.reviews,
        this.totalReviews,
    });

    factory BookReviewsModel.fromJson(Map<String, dynamic> json) => BookReviewsModel(
        averageRating: json["average_rating"],
        bookId: json["book_id"],
        bookTitle: json["book_title"],
        message: json["message"],
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
        totalReviews: json["total_reviews"],
    );

    Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "book_id": bookId,
        "book_title": bookTitle,
        "message": message,
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "total_reviews": totalReviews,
    };
}

class Review {
    final int? bookId;
    final DateTime? createdAt;
    final int? id;
    final String? ratingDescription;
    final int? ratingStarNumber;
    final String? userId;
    final StudentData? users;

    Review({
        this.bookId,
        this.createdAt,
        this.id,
        this.ratingDescription,
        this.ratingStarNumber,
        this.userId,
        this.users,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        bookId: json["book_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
        ratingDescription: json["rating_description"],
        ratingStarNumber: json["rating_star_number"],
        userId: json["user_id"],
        users: json["users"] == null ? null : StudentData.fromJson(json["users"]),
    );

    Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "rating_description": ratingDescription,
        "rating_star_number": ratingStarNumber,
        "user_id": userId,
        "users": users?.toJson(),
    };
}

