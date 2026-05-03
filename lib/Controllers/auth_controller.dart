import 'dart:convert';
import 'package:get/get.dart';
import 'package:libgenius/Auth/otp_screen.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/BottomNavBar/my_bottom_bar.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/user_model.dart';
import 'package:libgenius/Services/api.dart';
import 'package:libgenius/Services/api_services.dart';

class AuthController extends GetxController {
  final response = ApiResponse();

  Future<void> login({
    required String cms,
    required String password,
    bool isRemember = false,
  }) async {
    response.bodySetter = {'cms_id': cms, 'password': password};
    response.urlSetter = Api.loginAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      if (value.split(" ").first != 'error') {
        Get.back();
        userModel.value = userModelFromJson(value);

        if (userModel.value.studentData?.isVerified == false) {
          mySnackBar(
            title: 'Account Not Verified',
            message: "We've sent an OTP, Please check email for to verify.",
            duration: 2,
          );
          Get.to(() => OtpScreen(email: userModel.value.studentData!.email!));
        } else {
          isRemember ? box.write('user', userModel.value.toJson()) : null;
          Get.offAll(() => MyBottomBar());
        }
      } else {
        final msg = jsonDecode(value);
        mySnackBar(title: 'Error', message: msg['message']);
      }
    });
  }

  Future<void> register({
    required String cms,
    required String password,
    required String email,
  }) async {
    response.bodySetter = {'cms_id': cms, 'password': password, 'email': email};
    response.urlSetter = Api.signupAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);

        mySnackBar(
          title: 'Account Registered Successfully',
          message: "We've sent an OTP, Please check email to verify.",
          duration: 2,
        );
        Get.to(() => OtpScreen(email: userModel.value.studentData!.email!));
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  Future<void> verifyOtp({required String otp}) async {
    response.bodySetter = {'otp': otp};
    response.urlSetter = Api.verifyRegistration;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);

        mySnackBar(
          title: 'Account Verified Successfully',
          message: "Welcome To LibGenius",
          duration: 2,
        );
        Get.offAll(() => MyBottomBar());
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  //TODO Make Resend Button
  Future<void> resendOtp({required String cmsId}) async {
    response.bodySetter = {'cms_id': cmsId};
    response.urlSetter = Api.resendOtpAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySnackBar(
          title: 'OTP Sent Successfully',
          message: "We've sent an OTP, Please check email to verify.",
          duration: 2,
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  Future<void> forgetPassword({required String email}) async {
    response.bodySetter = {'email': email};
    response.urlSetter = Api.forgetPasswordAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySnackBar(
          title: 'OTP Sent Successfully',
          message: "We've sent an OTP, Please check email to verify.",
          duration: 2,
        );
        Get.to(() => OtpScreen(email: email, fromForget: true));
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  Future<void> verifyForgetOtp({required String otp}) async {
    response.bodySetter = {'otp': otp};
    response.urlSetter = Api.verifyForgetOtpAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySnackBar(
          title: 'OTP Verified Successfully!',
          message: "Now you can reset your password.",
          duration: 2,
        );
        // Get.to(() => ()); //TODO Make Reset Password
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  Future<void> resetPassword({
    required String cms,
    required String password,
  }) async {
    response.bodySetter = {'cms_id': cms, 'new_password': password};
    response.urlSetter = Api.resetPasswordAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySnackBar(
          title: 'Password Reset Successfully',
          message: "Now you can login with your new password.",
          duration: 2,
        );
        Get.offAll(() => LoginPage());
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    response.bodySetter = {
      'current_password': currentPassword,
      'new_password': newPassword,
    };
    response.urlSetter = Api.changePasswordAPI;
    response.type = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySnackBar(
          title: 'Password Changed Successfully!',
          message: "Now you can login with your new password.",
          duration: 2,
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        mySnackBar(title: 'Error', message: msg['error']);
      }
    });
  }
}
