import 'package:get_it/get_it.dart';
import 'package:learn_flutter_together/240411/data/data_source/photo_data_source.dart';
import 'package:learn_flutter_together/240411/data/repository/photo_repo_impl.dart';
import 'package:learn_flutter_together/240411/domain/repository/photo_repository.dart';
import 'package:learn_flutter_together/240411/domain/use_case/get_searched_photos_use_case.dart';
import 'package:learn_flutter_together/240411/domain/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoDataSource>(PhotoDataSource());
  getIt.registerSingleton<PhotoRepository>(
      PhotoRepositoryImpl(dataSource: getIt()));
  getIt.registerSingleton<GetSearchedPhotosUseCase>(
      GetSearchedPhotosUseCase(getIt()));
  getIt.registerSingleton<GetTopFiveMostViewedImagesUseCase>(
      GetTopFiveMostViewedImagesUseCase(getIt()));

  getIt.registerFactory<SearchListViewModel>(
    () => SearchListViewModel(
      getSearchedPhotosUseCase: getIt(),
      getTopFiveMostViewedImagesUseCase: getIt(),
    ),
  );
}
