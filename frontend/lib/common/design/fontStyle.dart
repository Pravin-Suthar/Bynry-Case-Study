// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:frontend/common/design/customColors.dart';

class CustomTextStyle {
static TextStyle T1(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1!.copyWith(
     fontFamily: 'Corbel',// Use Times New Roman font
    fontWeight: FontWeight.w400,
    color: Theme.of(context).extension<AppColors>()!.c12,
    fontSize: 30,
    letterSpacing: 0.2,
  );
}


  static TextStyle T2(BuildContext context) {
    return TextStyle(
     fontFamily: 'Corbel',
      fontWeight: FontWeight.w500,
      color: Theme.of(context).extension<AppColors>()!.c11,
      fontSize: 16,
      letterSpacing: 0.2,
    );
  }

  static TextStyle T3(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
           fontFamily: 'Corbel',
          fontWeight: FontWeight.w400,
          color: Theme.of(context).extension<AppColors>()!.c10,
          fontSize: 18,
          letterSpacing: 0.5,
        );
  }
  
  static TextStyle T4(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
           fontFamily: 'Corbel',
          fontWeight: FontWeight.w600,
          color: Theme.of(context).extension<AppColors>()!.c3,
          fontSize: 18,
          letterSpacing: 0.5,
        );
  }

  static TextStyle T5(BuildContext context) {
    return TextStyle(
      fontFamily: 'Verdana',
      fontWeight: FontWeight.w700,
      color: Theme.of(context).extension<AppColors>()!.c1,
      fontSize: 14,
      letterSpacing: 0.2,
    );
  }

  static TextStyle T6(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1!.copyWith(
     fontFamily: 'Corbel',// Use Times New Roman font
    fontWeight: FontWeight.w400,
    color: Theme.of(context).extension<AppColors>()!.c12,
    fontSize: 20,
    letterSpacing: 0.2,
  );
}

}
