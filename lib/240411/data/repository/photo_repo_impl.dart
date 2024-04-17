
import 'package:learn_flutter_together/240411/data/data_source/photo_data_source.dart';
import 'package:learn_flutter_together/240411/data/mapper/photo_mapper.dart';
import 'package:learn_flutter_together/240411/domain/model/photo.dart';
import 'package:learn_flutter_together/240411/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final data = await _dataSource.getPhotos(query);

    if( data.hits == null) {
      return [];
    }

    return data.hits!.map((e) => e.toPhoto()).toList();
  }
}
