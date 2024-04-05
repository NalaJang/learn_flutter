import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsetsDirectional.only(
          start: 20, end: 20, bottom: 10
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
                SizedBox(width: 20,),
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
            // Spacer(),
            SizedBox(),
            Row(
              children: [
                Icon(Icons.notifications_none),
              ],
            ),
          ],
        ),
        // Text(
        //   '달콤한 스타벅스 디저트와 \n 봄날의 오후를 함께해요!',
        //   style: TextStyle(
        //     fontSize: 17.0,
        //     color: Colors.black,
        //   ),
        // ),
        background: Image.network(
          'https://via.placeholder.com/150',
          fit: BoxFit.cover,
        ),
      ),
      actions: <Widget>[],
      floating: true,
    );
  }
}
