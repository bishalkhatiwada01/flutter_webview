import 'package:flutter/material.dart';
import 'package:watchonline/src/navigation_controller.dart';
import 'package:watchonline/src/splash_screen.dart';
import 'package:watchonline/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://totalsportek.pro/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewStack(
          controller: controller,
        ),
        bottomNavigationBar: NavigationControls(
          controller: controller,
        ),
      ),
    );
  }
}
