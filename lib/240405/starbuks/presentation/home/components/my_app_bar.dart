import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      toolbarHeight: 40,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          bottom: 10,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.mail_outline),
                    Text(
                      "What's New",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Icon(Icons.airplane_ticket_outlined),
                    Text(
                      'Coupon',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(),
            Row(
              children: [
                Icon(Icons.notifications_none),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
