import 'package:flutter/cupertino.dart';
import 'package:learn_flutter_together/240411/domain/model/photo.dart';
import 'package:learn_flutter_together/240411/domain/use_case/get_searched_photos_use_case.dart';
import 'package:learn_flutter_together/240411/domain/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_state.dart';

class SearchListViewModel with ChangeNotifier {
  final GetSearchedPhotosUseCase _getSearchedPhotosUseCase;
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;
  final _textController = TextEditingController();

  SearchListViewModel({
    required GetSearchedPhotosUseCase getSearchedPhotosUseCase,
    required GetTopFiveMostViewedImagesUseCase
    getTopFiveMostViewedImagesUseCase,
  })  : _getSearchedPhotosUseCase = getSearchedPhotosUseCase,
        _getTopFiveMostViewedImagesUseCase = getTopFiveMostViewedImagesUseCase;


  get textController => _textController;

  SearchListState _state = const SearchListState();

  SearchListState get state => _state;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void getPhotos(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _getSearchedPhotosUseCase.execute(query);
    _state = state.copyWith(
      photos: photos,
      isLoading: false,
    );

    notifyListeners();
  }

  void getTopFive(String query) async {
    _state = state.copyWith(isLoading: true, isClicked: !_state.isClicked);
    List<Photo> photos;

    if( _state.isClicked ) {
      photos = await _getTopFiveMostViewedImagesUseCase.execute(query);
    } else {
      photos = await _getSearchedPhotosUseCase.execute(query);
    }
    _state = state.copyWith(
      photos: photos,
      isLoading: false,
    );

    notifyListeners();
  }
}
