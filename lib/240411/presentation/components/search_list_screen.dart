import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatelessWidget {
  SearchListScreen({super.key});

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
          children: [
            TextField(
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
            ),
            Expanded(
              child: viewModel.isLoading
                  ? const CircularProgressIndicator()
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: viewModel.photos
                          .map((e) => Image.network(e.url))
                          .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
