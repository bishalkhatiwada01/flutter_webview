import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum _MenuOptions { cricHD, totalSports, mtvHustleS3, indianIdolS14 }

class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key, required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('no back history items'),
                ),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await controller.canGoForward()) {
              await controller.goForward();
            } else {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('No forward history item'),
                ),
              );
              return;
            }
          },
        ),
        IconButton(
          onPressed: () {
            controller.reload();
          },
          icon: const Icon(Icons.replay),
        ),
        PopupMenuButton<_MenuOptions>(
          onSelected: (value) async {
            switch (value) {
              case _MenuOptions.cricHD:
                await controller.loadRequest(
                  Uri.parse('https://mc6.crichd.com/'),
                );
                break;
              case _MenuOptions.totalSports:
                await controller.loadRequest(
                  Uri.parse('https://totalsportek.pro/'),
                );
                break;
              case _MenuOptions.mtvHustleS3:
                await controller.loadRequest(
                  Uri.parse('https://titlii.com/?s=mtv+hustle'),
                );
                break;
              case _MenuOptions.indianIdolS14:
                await controller.loadRequest(
                  Uri.parse('https://indianidol.net/category/full-episodes/'),
                );
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem<_MenuOptions>(
              value: _MenuOptions.cricHD,
              child: Text(
                'CricHD',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const PopupMenuItem(
              child: Text('TotalSports', style: TextStyle(fontSize: 14)),
              value: _MenuOptions.totalSports,
            ),
            const PopupMenuItem(
              value: _MenuOptions.mtvHustleS3,
              child: Text('MTV Hustle S3', style: TextStyle(fontSize: 14)),
            ),
            const PopupMenuItem(
              value: _MenuOptions.indianIdolS14,
              child: Text('Indian Idol S14'),
            )
          ],
        ),
      ],
    );
  }
}
