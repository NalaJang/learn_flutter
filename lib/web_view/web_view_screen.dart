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
      // 웹 사이트는 자바 스크립트를 많이 사용하기 때문에 이 옵션을 꼭 넣어준다.
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      )
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          // 유튜브 링크로 들어가는 것을 막는다.
          if (request.url.startsWith('https://www.youtube.com/')) {
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
        title: const Text('나만의 웹 브라우저'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          // 어떤 값(여기선 String)을 표시할 건지 타입 지정
          PopupMenuButton<String>(
            onSelected: (value) {
              controller.loadRequest(Uri.parse(value));
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'https://flutter.dev',
                child: Text('플러터'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.google.com/',
                child: Text('구글'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.naver.com/',
                child: Text('네이버'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.kakaocorp.com/page/',
                child: Text('카카오'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.youtube.com/',
                child: Text('유튜브'),
              ),
            ],
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
