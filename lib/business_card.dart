import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            nameSection(),
            const SizedBox(height: 30.0,),

            Row(
              children: [
                const Spacer(),
                detailInfo(),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget nameSection() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 50.0,
            ),

            Text(
              'Jang',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('💻'),
            Text(
              ' App developer',
              style: TextStyle(
                fontSize: 20.0,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget detailInfo() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.phone),
            Text(' 010-xxxx-xxxx'),
          ],
        ),

        SizedBox(height: 10,),

        Row(
          children: [
            Icon(Icons.email),
            Text(' sample@email.com'),
          ],
        ),

        SizedBox(height: 10,),

        Row(
          children: [
            Icon(CupertinoIcons.link),
            Text(' blog sample@email.com'),
          ],
        ),
      ],
    );
  }
}
