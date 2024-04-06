import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      )
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          // 유튜브 링크로 들어가는 것을 막는다.
          if( request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          // 그 외에는 이동을 허용
          return NavigationDecision.navigate;
        },
        onUrlChange: (UrlChange change) {
          debugPrint('url change to ${change.url}');
        },
        onPageFinished: (String url) {
          debugPrint('page finished loading url: $url');
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나만의 웹 브라우저'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
