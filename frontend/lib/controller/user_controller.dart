import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/LandingPage/landing_page.dart';
import 'package:frontend/api_url.dart';
import 'package:frontend/common/sncakbar.dart';
import 'package:frontend/home.dart';
import 'package:frontend/login_registration/registration.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void userValueClearer() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    otpController.clear();
  }

  var isOtpSend = false.obs;
  void registerUser() async {
    try {
      String body = json.encode({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phoneNumber': phoneNumberController.text,
      });

      http.Response res = await http.post(
        Uri.parse(registerUserUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      var jsonData = jsonDecode(res.body);

      if (jsonData['success']) {
        successSnackBar(
            Get.context as BuildContext, 'Examiner registered successfully!');
        Get.to(() => Homepage());
        userValueClearer();
      } else {
        successSnackBar(Get.context as BuildContext, "Something Went Wrong");
      }
    } catch (error) {
      warningSnackBar(Get.context as BuildContext,
          'Registration failed. Please try again later.');
    }
  }

  void loginExaminer() async {
    try {
      var body = json.encode({'email': emailController.text.trim()});
      http.Response res = await http.post(
        Uri.parse(loginUserUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      var jsonData = jsonDecode(res.body);
      print(jsonData);
      if (jsonData['success'] == true) {
        isOtpSend.value = true;
       
        successSnackBar(Get.context as BuildContext, jsonData['message']);
      } else {
        warningSnackBar(Get.context as BuildContext, 'Please Register First');
        Get.to(() => UserRegistrationScreen());
      }
    } catch (e) {
      warningSnackBar(Get.context as BuildContext, 'Something went wrong');
    }
  }

  void verifyOtp() async {
    try {
      String email = emailController.text.trim();
      var body = json.encode({'email': email, 'otp': otpController.text});
      http.Response res = await http.post(
        Uri.parse(verifyUserUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      var jsonData = jsonDecode(res.body);

      if (jsonData['success'] == true) {
        isOtpSend.value = false;
        Get.to(() => LandingPage());
        userValueClearer();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('userid', (jsonData['usersid']));

        successSnackBar(Get.context as BuildContext, 'Logged in successfully');
      } else {
        warningSnackBar(
            Get.context as BuildContext, 'Please try / contact support team.');
      }
    } catch (e) {
      warningSnackBar(Get.context as BuildContext, 'Something went wrong');
    }
  }
}
