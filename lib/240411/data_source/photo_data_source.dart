import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_fluuter_together/240411/dto/photo_data_dto.dart';

class PhotoDataSource {
  final String _baseUrl = 'https://pixabay.com/api';

  Future<PhotoDataDto> getPhotos(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?key=43171022-dca0290df38de24cd7ba6ed14&q=$query&image_type=photo'));

    if (response.statusCode == 200) {
      final jsonString = jsonDecode(response.body);

      return PhotoDataDto.fromJson(jsonString);
    } else {
      return throw 'HTTP 에러';
    }
  }
}
