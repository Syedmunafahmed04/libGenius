// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final String? accessToken;
    final String? message;
    final StudentData? studentData;

    UserModel({
        this.accessToken,
        this.message,
        this.studentData,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        message: json["message"],
        studentData: json["student_data"] == null ? null : StudentData.fromJson(json["student_data"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "message": message,
        "student_data": studentData?.toJson(),
    };
}

class StudentData {
    final String? campus;
    final String? cmsId;
    final DateTime? createdAt;
    final DateTime? dateOfBirth;
    final String? department;
    final String? email;
    final String? faculty;
    final bool? isBlocked;
    final bool? isVerified;
    final dynamic otp;
    final DateTime? otpCreatedAt;
    final String? passwordHash;
    final String? phoneNo;
    final dynamic profilePictureUrl;
    final String? semester;
    final String? studentName;
    final String? userId;

    StudentData({
        this.campus,
        this.cmsId,
        this.createdAt,
        this.dateOfBirth,
        this.department,
        this.email,
        this.faculty,
        this.isBlocked,
        this.isVerified,
        this.otp,
        this.otpCreatedAt,
        this.passwordHash,
        this.phoneNo,
        this.profilePictureUrl,
        this.semester,
        this.studentName,
        this.userId,
    });

    factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        campus: json["campus"],
        cmsId: json["cms_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        department: json["department"],
        email: json["email"],
        faculty: json["faculty"],
        isBlocked: json["is_blocked"],
        isVerified: json["is_verified"],
        otp: json["otp"],
        otpCreatedAt: json["otp_created_at"] == null ? null : DateTime.parse(json["otp_created_at"]),
        passwordHash: json["password_hash"],
        phoneNo: json["phone_no"],
        profilePictureUrl: json["profile_picture_url"],
        semester: json["semester"],
        studentName: json["student_name"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "campus": campus,
        "cms_id": cmsId,
        "created_at": createdAt?.toIso8601String(),
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "department": department,
        "email": email,
        "faculty": faculty,
        "is_blocked": isBlocked,
        "is_verified": isVerified,
        "otp": otp,
        "otp_created_at": otpCreatedAt?.toIso8601String(),
        "password_hash": passwordHash,
        "phone_no": phoneNo,
        "profile_picture_url": profilePictureUrl,
        "semester": semester,
        "student_name": studentName,
        "user_id": userId,
    };
}
