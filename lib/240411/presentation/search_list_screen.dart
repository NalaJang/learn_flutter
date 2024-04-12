import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240411/presentation/components/image_card_widget.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_view_model.dart';
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
            const SizedBox(height: 20),
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
}
