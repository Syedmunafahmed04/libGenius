import 'dart:convert';

import 'package:get/get.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/book_reviews_model.dart';
import 'package:libgenius/Models/books_model.dart';
import 'package:libgenius/Models/chatbot_model.dart';
import 'package:libgenius/Models/history_model.dart';
import 'package:libgenius/Models/issue_model.dart';
import 'package:libgenius/Services/api.dart';
import 'package:libgenius/Services/api_services.dart';

class BookController extends GetxController {
  final response = ApiResponse();
  Rx<BooksModel> booksModel = BooksModel().obs;
  Rx<HistoryModel> historyModel = HistoryModel().obs;
  Rx<IssueModel> issueModel = IssueModel().obs;
  Rx<BookReviewsModel> bookReviewsModel = BookReviewsModel().obs;
  Rx<ChatbotModel> chatbotModel = ChatbotModel().obs;

  Future<void> getBooks() async {
    response.urlSetter = Api.booksAPI;
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };
    response.typeSetter = 'get';
    await response.hitAPI().then((value) {
      if (value.split(" ").first != 'error') {
        booksModel.value = booksModelFromJson(value);
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> submitReview({
    required String bookId,
    required String ratings,
    required String reviews,
  }) async {
    response.bodySetter2 = {
      'rating_star_number': ratings,
      'rating_description': reviews,
      'book_id': bookId,
    };
    response.urlSetter = Api.bookReviewAPI;
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };

    response.typeSetter = 'post';
    myLoadingDialog();

    await response.hitAPI().then((value) async {
      if (value.split(" ").first != 'error') {
        await getReviews(bookId: bookId);
        Get.back();
        // mySuccessDialog(
        //   title: "Review Submitted Successfully",
        //   subtitle: "Other students can now see your reviews",
        //   ontap: () {
        //     Get.back();
        //   },
        // );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        Get.back();
        myWarningDialog(
          title: 'Error',
          subtitle: msg['error'],
          btnTitle: 'Continue',

          ontap: () {
            Get.back();
          },
        );
      }
    });
  }

  Future<void> getUserHistory() async {
    response.urlSetter = Api.userHistoryAPI;
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };
    response.typeSetter = 'get';
    historyModel.value = HistoryModel();
    await response.hitAPI().then((value) {
      if (value.split(" ").first != 'error') {
        historyModel.value = historyModelFromJson(value);
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myPrint(msg['message']);
      }
    });
  }

  Future<void> getIssuedBooks() async {
    response.urlSetter = Api.issueBookAPI;
    response.headerSetter = {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };

    response.typeSetter = 'get';

    await response.hitAPI().then((value) {
      if (value.split(" ").first != 'error') {
        issueModel.value = issueModelFromJson(value);
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myPrint(msg['message']);
      }
    });
  }

  Future<void> dropBook({
    required String bookId,
    required IssuedBook issuedBook,
  }) async {
    response.urlSetter = Api.dropBookAPI;
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };

    response.bodySetter2 = {'book_id': bookId};
    response.typeSetter = 'post';

    myLoadingDialog();

    await response.hitAPI().then((value) async {
      if (value.split(" ").first != 'error') {
        await getIssuedBooks();
        Get.back();
        mySuccessDialog(
          title: 'Dropped Successfully!',
          subtitle:
              '${issuedBook.book?.title} has been dropped and will be remove from your account',
        );
      } else {
        Get.back();
        final msg = jsonDecode(value.split("error ").last);
        myPrint(msg['message']);
      }
    });
  }

  Future<void> getReviews({required String bookId}) async {
    response.urlSetter = '${Api.getReviewsAPI}/$bookId';
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };

    response.typeSetter = 'get';

    bookReviewsModel.value = BookReviewsModel();

    await response.hitAPI().then((value) {
      if (value.split(" ").first != 'error') {
        bookReviewsModel.value = bookReviewsModelFromJson(value);
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myPrint(msg['message']);
      }
    });
  }

  Future<void> getChatbotMessage({
    required String message,
    required List<Map<String, String>> history,
  }) async {
    response.urlSetter = Api.chatbotAPI;
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };

    response.bodySetter2 = {
      'question': message,
      'conversation_history': history,
    };
    response.typeSetter = 'post';

    await response.hitAPI().then((value) async {
      if (value.split(" ").first != 'error') {
        chatbotModel.value = chatbotModelFromJson(value);
        myPrint('Chatbot Response: ${chatbotModel.value.answer}');
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myPrint(msg['message']);
      }
    });
  }
}
