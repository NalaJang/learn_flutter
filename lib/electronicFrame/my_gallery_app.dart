import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyGalleryApp extends StatefulWidget {
  const MyGalleryApp({super.key});

  @override
  State<MyGalleryApp> createState() => _MyGalleryAppState();
}

class _MyGalleryAppState extends State<MyGalleryApp> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images;
  int currentPage = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('전자액자'),
      ),
      body: images == null
          ? const Center(child: Text('no data'))
          : PageView(
              controller: pageController,
              children: images!.map((image) {
                return FutureBuilder<Uint8List>(
                  future: image.readAsBytes(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;

                    if (data == null ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Image.memory(
                      data,
                      width: double.infinity,
                    );
                  },
                );
              }).toList(),
            ),
    );
  }

  Future<void> loadImages() async {
    images = await _picker.pickMultiImage();

    if (images != null) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        // 현재 페이지를 기억하고 시간이 되면 다음 페이지로 넘어가도록 구현
        currentPage++;

        // 끝까지 이동하면 다시 첫 페이지로 이동
        if (currentPage > images!.length - 1) {
          currentPage = 0;
        }
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    }
    setState(() {});
  }
}
