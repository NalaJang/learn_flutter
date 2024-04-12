import 'package:flutter/cupertino.dart';
import 'package:learn_fluuter_together/240411/data/model/photo.dart';
import 'package:learn_fluuter_together/240411/data/repository/photo_repository.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_state.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepository _repository;
  final _textController = TextEditingController();

  SearchListViewModel({
    required PhotoRepository repository,
  }) : _repository = repository;

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

    final photos = await _repository.getPhotos(query);
    _state = state.copyWith(
      photos: photos,
      isLoading: false,
    );

    notifyListeners();
  }
}
