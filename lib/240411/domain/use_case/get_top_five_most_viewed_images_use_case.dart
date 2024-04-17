import 'package:learn_flutter_together/240411/domain/repository/photo_repository.dart';

import '../model/photo.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> execute(String query) async {
    final photos = await _repository.getPhotos(query);
    final getTopFiveList = photos.take(5).toList();

    return getTopFiveList;
  }
}