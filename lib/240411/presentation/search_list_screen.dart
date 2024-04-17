import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter_together/240411/presentation/components/image_card_widget.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<SearchListViewModel>();
      viewModel.getPhotos('apple');
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSearchedResult(viewModel),

            const SizedBox(height: 10),

            _getTopFive(viewModel),

            const SizedBox(height: 10),
            Expanded(
              child: viewModel.state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: viewModel.state.photos
                          .map((e) => ImageCardWidget(photo: e))
                          .toList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchedResult(SearchListViewModel viewModel) {
    return TextField(
      controller: viewModel.textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            final query = viewModel.textController.text;
            viewModel.getPhotos(query);
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _getTopFive(SearchListViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        final query = viewModel.textController.text;
        viewModel.getTopFive(query);
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
            viewModel.state.isClicked ? Colors.orange : Colors.grey,
          ),
          color:
          viewModel.state.isClicked ? Colors.orange : Colors.white,
        ),
        child: Text(
          '조회순',
          style: TextStyle(
            color:
            viewModel.state.isClicked ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
