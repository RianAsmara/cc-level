import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LevelDetailScreen extends StatelessWidget {
  final int levelNumber;

  const LevelDetailScreen({super.key, required this.levelNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelNumber'),
      ),
      body: WebviewScaffold(
        url: 'http://localhost:8080/level$levelNumber.html',
        withJavascript: true,
        javascriptChannels: {
          JavascriptChannel(
            name: 'levelChannel',
            onMessageReceived: (JavascriptMessage message) {
              String result = message.message;
              if (result == 'win') {
                log('Level $levelNumber: Win');
              } else if (result == 'lose') {
                log('Level $levelNumber: Lose');
              }
            },
          ),
        },
      ),
    );
  }
}
