import 'package:frontend/common/sncakbar.dart';
import 'package:get/get.dart';
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

class LandingPageController extends GetxController {
  var isExpanded = false.obs;
  var userName = ''.obs;

  void getUserDetail() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userid');

      String body = json.encode({"userId": userId});

      http.Response res = await http.post(
        Uri.parse(getUserDetails),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      var jsonData = jsonDecode(res.body);

      if (jsonData['success'] == true) {
        var userDetails = jsonData['userDetails'];
        userName.value = userDetails['firstName'];
      } else {
        // Handle error case if needed
      }
    } catch (error) {
      // Handle error case if needed
    }
  }
}

