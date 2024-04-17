import 'package:learn_flutter_together/240411/domain/model/photo.dart';
import 'package:learn_flutter_together/240411/domain/repository/photo_repository.dart';

class GetSearchedPhotosUseCase {

  final PhotoRepository _repository;


  GetSearchedPhotosUseCase(this._repository);

  Future<List<Photo>> execute(String query) async {

    final photos = await _repository.getPhotos(query);

    return photos;
  }
}