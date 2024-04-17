import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_together/240404_you_tube/data/model/shorts_model.dart';

class ShortsWidget extends StatelessWidget {
  final ShortsModel shorts;

  const ShortsWidget({
    super.key,
    required this.shorts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 5,
        right: 10,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              shorts.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10, // 아래에 정렬
            left: 10,
            right: 10,
            child: Column(
              children: [
                Text(
                  shorts.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  // overflow: TextOverflow.clip,
                  // maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      shorts.viewsTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      shorts.views,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
