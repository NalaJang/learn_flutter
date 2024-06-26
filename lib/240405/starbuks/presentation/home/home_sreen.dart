import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/model/whats_new_model.dart';
import 'components/e_frequency.dart';
import 'components/headerWidget.dart';
import 'components/my_app_bar.dart';
import 'components/whats_new_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<WhatsNewModel> whatsNews;

  const HomeScreen({
    super.key,
    required this.whatsNews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeaderWidget(),
          MyAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    EFrequency(),
                    _midImage(),
                    _whatsNew(),
                    _bottomImage(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _whatsNew() {
    return Column(
      children: [
        _whatsNewTitle(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: whatsNews
                .map((e) => WhatsNewWidget(
                        whatsNew: WhatsNewModel(
                      image: e.image,
                      title: e.title,
                      subtitle: e.subtitle,
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _whatsNewTitle() {
    return Row(
      children: [
        const Text(
          "What's New",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }

  Widget _midImage() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: Image.asset('assets/images/star_bucks/img_starbucks_2.png'),
    );
  }

  Widget _bottomImage() {
    return Image.asset('assets/images/star_bucks/img_starbucks_2.png');
  }
}
