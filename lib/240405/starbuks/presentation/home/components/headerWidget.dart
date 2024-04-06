import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Stack(
            children: [
              const Positioned(
                left: 20.0,
                bottom: 0,
                child: Text(
                  '달콤한 스타벅스 디저트와 \n봄날의 오후를 함께해요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Lottie.asset('assets/images/star_bucks/cherry_blossom.json'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1 ★ until next Reward',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 7.0,
                        borderRadius: BorderRadius.circular(5.0),
                        backgroundColor: CupertinoColors.systemGrey2,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.brown),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  '4',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' / 5 ★',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey2,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
