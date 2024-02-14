import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/common/design/customColors.dart';
import 'package:frontend/common/design/fontStyle.dart';
import 'package:frontend/common/textfield_decoration.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final UserController userController = Get.put(UserController());
  final labelscrollcontroller = ScrollController(
    initialScrollOffset: 0,
    keepScrollOffset: true,
  );

  bool isDropdownOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).extension<AppColors>()!.c1,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
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
                                'Build a Digital Utility of Tomorrow!',
                                style: CustomTextStyle.T6(context),
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
                                'Register Today',
                                style: CustomTextStyle.T1(context),
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
                          color: Theme.of(context).extension<AppColors>()!.c11,
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 400),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "We believe in the power of two – Technology and Human intelligence",
                                    style: CustomTextStyle.T3(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white, // Color of the overlay container
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          TextField(
                            enabled: true,
                            controller: userController.firstNameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: 5, left: 30),
                              hintText: "First Name",
                              hintStyle: CustomTextStyle.T3(context),
                              border: InputBorder.none, // Remove default border
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 300,
                            color: Theme.of(context).extension<AppColors>()!.c10
                                as Color,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            enabled: true,
                            controller: userController.lastNameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: 5, left: 30),
                              hintText: "Last Name",
                              hintStyle: CustomTextStyle.T3(context),
                              border: InputBorder.none, // Remove default border
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 300,
                            color: Theme.of(context).extension<AppColors>()!.c10
                                as Color,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            enabled: true,
                            controller: userController.emailController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: 5, left: 30),
                              hintText: "Email",
                              hintStyle: CustomTextStyle.T3(context),
                              border: InputBorder.none, // Remove default border
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 300,
                            color: Theme.of(context).extension<AppColors>()!.c10
                                as Color,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            enabled: true,
                            controller:
                                userController.phoneNumberController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: 5, left: 30),
                              hintText: "Contact Number",
                              hintStyle: CustomTextStyle.T3(context),
                              border: InputBorder.none, // Remove default border
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 300,
                            color: Theme.of(context).extension<AppColors>()!.c10
                                as Color,
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
                                userController.registerUser();
                              },
                              child: Text(
                                'REGISTER',
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
    );
  }
}
