import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240411/data/model/photo.dart';

class ImageCardWidget extends StatelessWidget {
  final Photo photo;

  const ImageCardWidget({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        photo.url,
        fit: BoxFit.cover,
      ),
    );
  }
}
