import 'package:flutter/cupertino.dart';
import 'package:learn_fluuter_together/240411/data/model/photo.dart';
import 'package:learn_fluuter_together/240411/data/repository/photo_repository.dart';

class SearchListViewModel with ChangeNotifier {
  bool _isLoading = false;
  List<Photo> _photos = [];
  final PhotoRepository _repository;
  final _textController = TextEditingController();

  SearchListViewModel({
    required PhotoRepository repository,
  }) : _repository = repository;

  List<Photo> get photos => List.unmodifiable(_photos);

  bool get isLoading => _isLoading;

  get textController => _textController;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void getPhotos(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _repository.getPhotos(query);
    _isLoading = false;
    print('_photos : ${_photos.length}');

    notifyListeners();
  }
}
