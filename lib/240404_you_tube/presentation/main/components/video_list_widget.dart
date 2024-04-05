import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_fluuter_together/240404_you_tube/data/model/video_model.dart';

class VideoListWidget extends StatelessWidget {
  final VideoModel videoModel;

  const VideoListWidget({
    super.key,
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        children: [
          // 영상
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  videoModel.videoImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      videoModel.videoLength,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              // 유튜버 프로필 이미지
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipOval(
                  child: Image.asset(
                    videoModel.profileImage,
                    width: 50, // 원하는 이미지 너비
                    height: 50, // 원하는 이미지 높이
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 영상 제목, 유튜버 이름
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(videoModel.title),
                    Text(
                      videoModel.subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // 더 보기 아이콘
              const Icon(Icons.more_vert_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
