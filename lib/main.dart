import 'package:flutter/material.dart';
import 'package:watchonline/controller/navigation_controller.dart';
import 'package:watchonline/src/splash_screen.dart';
import 'package:watchonline/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
        designSize: Size(390, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }),
  );
}
