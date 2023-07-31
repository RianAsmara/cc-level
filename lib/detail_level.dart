import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LevelDetailScreen extends StatelessWidget {
  final int levelNumber;
  final String htmlContent;

  LevelDetailScreen({Key? key, required this.levelNumber, required this.htmlContent}) : super(key: key);

  late InAppWebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelNumber'),
      ),
      body: InAppWebView(
        initialData: InAppWebViewInitialData(data: generateHTMLResponse(levelNumber.toString())),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            transparentBackground: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          // You can interact with the InAppWebViewController here if needed.
          this.controller = controller;
        },
        onLoadStart: (controller, url) {
          // Called when the WebView starts loading a page.
        },
        onLoadStop: (controller, url) {
          // Called when the WebView finishes loading a page.
        },
        onProgressChanged: (controller, progress) {
          // Update loading bar.
        },
        onLoadError: (controller, url, code, message) {
          log("ERROR ___ $message");
          // Handle loading errors.
        },
        // shouldOverrideUrlLoading: (controller, navigationAction) {
        //   // Use this to control navigation behavior (e.g., allow or block certain URLs).
        //   return NavigationActionPolicy.ALLOW;
        // },
      ),
    );
  }
}


String generateHTMLResponse(String level) {
    return '''
    <!DOCTYPE html>
    <html>
    
    <head>
        <title>Level: $level</title>
    </head>
    
    <body>
        <h1>Level: $level</h1>
        <h2>Which one do you choose?</h2>
        <div style="
            margin: 2rem; 
            display: flex; 
            flex-direction: row;
            flex-direction: row;
            flex-wrap: wrap;
            ">
            <button id="win" style="
                border: none; 
                margin-right: 1rem;
                padding: 1rem; 
                background-color: green; 
                color: white; 
                font-weight: bolder;
                font-size: 1rem;
                ">Win</button>
                    <button id="lose" style="
                border: none; 
                padding: 1rem; 
                background-color: red; 
                color: white; 
                font-weight: bolder;
                font-size: 1rem;">Lose</button>
        </div>
    </body>
    
    </html>
  ''';
  }
