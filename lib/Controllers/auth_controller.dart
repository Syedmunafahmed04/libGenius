import 'dart:convert';
import 'package:get/get.dart';
import 'package:libgenius/Auth/otp_screen.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/Auth/reset_password.dart';
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
    response.bodySetter2 = {'cms_id': cms, 'password': password};
    response.urlSetter = Api.loginAPI;
    response.typeSetter = 'post';

    response.headerSetter = {'Content-Type': 'application/json'};

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);

        if (userModel.value.studentData?.isVerified == false) {
          myWarningDialog(
            title: 'Account Not Verified',
            subtitle: "We've sent an OTP, Please check email to verify.",
            btnTitle: 'Continue',

            ontap: () {
              Get.off(() => OtpScreen());
            },
          );
        } else {
          isRemember ? box.write('user', userModel.value.toJson()) : null;
          Get.offAll(() => MyBottomBar());
        }
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> register({
    required String cms,
    required String password,
    required String email,
  }) async {
    response.bodySetter2 = {
      'cms_id': cms,
      'password': password,
      'email': email,
    };
    response.urlSetter = Api.signupAPI;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);
        mySuccessDialog(
          title: 'Account Registered',
          subtitle: 'We\'ve sent an OTP, Please check email to verify.',
          btnTitle: 'Continue',
          ontap: () {
            Get.off(() => OtpScreen());
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> verifyOtp({required String otp}) async {
    response.bodySetter2 = {'otp': otp};
    response.urlSetter = Api.verifyRegistration;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);

        mySuccessDialog(
          title: 'Account Verified',
          subtitle: 'Welcome To LibGenius',
          btnTitle: 'Continue',
          ontap: () {
            Get.offAll(() => MyBottomBar());
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  //TODO Make Resend Button
  Future<void> resendOtp({required String cmsId}) async {
    response.bodySetter2 = {'cms_id': cmsId};
    response.urlSetter = Api.resendOtpAPI;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySuccessDialog(
          title: 'OTP Sent Successfully',
          subtitle: "We've sent an OTP, Please check email to verify.",
          btnTitle: 'Continue',
          ontap: () {
            Get.back();
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> forgetPassword({required String cms}) async {
    response.bodySetter2 = {'cms_id': cms};
    response.urlSetter = Api.forgetPasswordAPI;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySuccessDialog(
          title: 'OTP Sent Successfully',
          subtitle: "We've sent an OTP, Please check email to verify.",
          btnTitle: 'Continue',
          ontap: () {
            Get.off(() => OtpScreen(fromForget: true));
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> verifyForgetOtp({required String otp}) async {
    response.bodySetter2 = {'otp': otp};
    response.urlSetter = Api.verifyForgetOtpAPI;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        final data = jsonDecode(value);
        mySuccessDialog(
          title: 'OTP Verified Successfully!',
          subtitle: "Now you can reset your password.",
          btnTitle: 'Continue',
          ontap: () {
            Get.off(() => ResetPassword(cms: data['cms_id']));
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> resetPassword({
    required String cms,
    required String password,
  }) async {
    response.bodySetter2 = {'cms_id': cms, 'new_password': password};
    response.urlSetter = Api.resetPasswordAPI;
    response.typeSetter = 'post';
    response.headerSetter = {'Content-Type': 'application/json'};
    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySuccessDialog(
          title: 'Password Reset Successfully!',
          subtitle: "Now you can login with your new password.",
          btnTitle: 'Continue',
          ontap: () {
            Get.offAll(() => LoginPage());
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    response.bodySetter2 = {
      'current_password': currentPassword,
      'new_password': newPassword,
    };
    response.headerSetter = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };
    response.urlSetter = Api.changePasswordAPI;
    response.typeSetter = 'post';

    myLoadingDialog();
    await response.hitAPI().then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        mySuccessDialog(
          title: 'Password Changed Successfully!',
          subtitle: "Now you can login with your new password.",
          btnTitle: 'Continue',
          ontap: () {
            Get.back();
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }

  Future<void> updateProfileImage({required String image}) async {
    response.headerSetter = {
      'Authorization': 'Bearer ${userModel.value.accessToken}',
    };
    response.urlSetter = Api.updateProfileAPI;
    response.typeSetter = 'put';

    myLoadingDialog();

    await response.hitMultipartAPI(image, key: 'profile_picture_url').then((value) {
      Get.back();
      if (value.split(" ").first != 'error') {
        userModel.value = userModelFromJson(value);
        mySuccessDialog(
          title: 'Profile Updated Successfully!',
          subtitle: "Changes will reflect shortly.",
          btnTitle: 'Continue',
          ontap: () {
            Get.back();
          },
        );
      } else {
        final msg = jsonDecode(value.split("error ").last);
        myWarningDialog(title: 'Error', subtitle: msg['error']);
      }
    });
  }
}
