import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum _MenuOptions {
  navigationDelegate,
}

class Menu extends StatelessWidget {
  const Menu({super.key, required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      onSelected: (value) async {
        switch (value) {
          case _MenuOptions.navigationDelegate:
            await controller.loadRequest(Uri.parse('https://mc6.crichd.com/'));
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.navigationDelegate,
          child: Text('CricHD'),
        )
      ],
    );
  }
}