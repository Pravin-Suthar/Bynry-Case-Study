import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/LandingPage/landing_page.dart';
import 'package:frontend/common/design/colorPallet.dart';
import 'package:frontend/home.dart';
import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext BuildContext, Widget? context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          home: LandingPage(),
        );
      },
    );
  }
}
