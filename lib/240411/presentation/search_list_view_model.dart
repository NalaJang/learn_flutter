import 'package:flutter/cupertino.dart';
import 'package:learn_flutter_together/240411/domain/use_case/get_searched_photos_use_case.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_state.dart';

class SearchListViewModel with ChangeNotifier {
  final GetSearchedPhotosUseCase _getSearchedPhotosUseCase;
  final _textController = TextEditingController();

  SearchListViewModel({
    required GetSearchedPhotosUseCase getSearchedPhotosUseCase,
  }) : _getSearchedPhotosUseCase = getSearchedPhotosUseCase;
  get textController => _textController;

  SearchListState _state = const SearchListState();

  SearchListState get state => _state;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void getPhotos(String query) async {
    // _isLoading = true;
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _getSearchedPhotosUseCase.execute(query);
    _state = state.copyWith(
      photos: photos,
      isLoading: false,
    );

    notifyListeners();
  }
}
