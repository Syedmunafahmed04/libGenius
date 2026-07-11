class Api {
  static const String mainIP = 'https://tablet-landowner-rudder.ngrok-free.dev';
  static const String baseAPI = '$mainIP/api';

  //Auth
  static const String loginAPI = '$baseAPI/login';
  static const String signupAPI = '$baseAPI/signup';
  static const String verifyRegistration = '$baseAPI/verify';
  static const String resendOtpAPI = '$baseAPI/resend-otp';
  static const String forgetPasswordAPI = '$baseAPI/forgot-password';
  static const String verifyForgetOtpAPI = '$baseAPI/verify-reset-otp';
  static const String resetPasswordAPI = '$baseAPI/reset-password';
  static const String changePasswordAPI = '$baseAPI/change-password';
  static const String updateProfileAPI = '$baseAPI/edit-profile';
  static const String sendFcmTokenAPI = '$baseAPI/user/save-fcm-token';

  //Books
  static const String booksAPI = '$baseAPI/get-books';
  static const String bookReviewAPI = '$baseAPI/add-reviews';
  static const String getReviewsAPI = '$baseAPI/get-reviews';
  static const String userHistoryAPI = '$baseAPI/my-issued-books/history';
  static const String issueBookAPI = '$baseAPI/my-issued-books';
  static const String dropBookAPI = '$baseAPI/drop-book';

  // Chatbot
  static const String chatbotAPI = '$baseAPI/chatbot';
}
