import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/common/design/customColors.dart';
import 'package:frontend/common/design/fontStyle.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/login_registration/registration.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).extension<AppColors>()!.c1,
          statusBarBrightness: Brightness.light,
        ),
        child: Obx(
          () => SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                bool exitConfirmed = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Exit'),
                      content:
                          const Text('Are you sure you want to exit the app?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(false); // User does not want to exit
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            SystemNavigator.pop(); // User confirms exit
                          },
                          child: const Text('Exit'),
                        ),
                      ],
                    );
                  },
                );
                return exitConfirmed;
              },
              child: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()!.c2,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Welcome Back!',
                                      style: CustomTextStyle.T1(context),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Login into your account',
                                      style: CustomTextStyle.T2(context),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: MediaQuery.of(context).size.height * 0.81,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                                color: Theme.of(context)
                                    .extension<AppColors>()!
                                    .c11,
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 400),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Don't have an account ?",
                                            style: CustomTextStyle.T3(context),
                                          ),
                                          GestureDetector(
                                            onTap: (() {
                                              Get.to(() =>
                                                  UserRegistrationScreen());
                                            }),
                                            child: SizedBox(
                                        
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0.h),
                                                child: Text(
                                                  'Sign Up',
                                                  style: CustomTextStyle.T4(
                                                      context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 175,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors
                                  .white, // Color of the overlay container
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  enabled: true,
                                  controller:
                                      userController.emailController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 5, left: 30),
                                    hintText: "Enter the Email Id",
                                    hintStyle: CustomTextStyle.T3(context),
                                    border: InputBorder
                                        .none, // Remove default border
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 300,
                                  color: Theme.of(context)
                                      .extension<AppColors>()!
                                      .c10 as Color,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  enabled: true,
                                  controller: userController.otpController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 5, left: 30),
                                    hintText: "Enter the otp",
                                    hintStyle: CustomTextStyle.T3(context),
                                    border: InputBorder
                                        .none, // Remove default border
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 300,
                                  color: Theme.of(context)
                                      .extension<AppColors>()!
                                      .c10 as Color,
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: (){
                                    userController
                                              .loginExaminer();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 20.0.h),
                                        child: Text(
                                          'Resend otp',
                                          style: CustomTextStyle.T4(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                                SizedBox(
                                  height: 50,
                                  width: 330,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .extension<AppColors>()!
                                          .c4 as Color,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5), // Adjust the value as needed
                                      ),
                                    ),
                                    onPressed: () {
                                      userController.isOtpSend.value
                                          ? userController.verifyOtp()
                                          : userController
                                              .loginExaminer();
                                    },
                                    child: Text(
                                      userController.isOtpSend.value
                                          ? 'SUBMIT'
                                          : 'LOGIN',
                                      style: CustomTextStyle.T2(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
