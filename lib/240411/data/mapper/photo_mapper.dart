
import 'package:learn_fluuter_together/240411/data/dto/photo_data_dto.dart';
import 'package:learn_fluuter_together/240411/data/model/photo.dart';

extension PhotoMapper on Hits {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      url: previewURL ?? '',
      tags: tags ?? '',
    );
  }
}
