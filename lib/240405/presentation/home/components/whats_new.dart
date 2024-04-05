import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240405/data/model/whats_new_model.dart';

class WhatsNew extends StatelessWidget {
  final WhatsNewModel whatsNew;

  const WhatsNew({
    super.key,
    required this.whatsNew,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 5,
        right: 10,
      ),
      child: Column(
        children: [
          _title(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              whatsNew.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(whatsNew.title),
          Text(whatsNew.subtitle),
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        const Text(
          "What's New",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
