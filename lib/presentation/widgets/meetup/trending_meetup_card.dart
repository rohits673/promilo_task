import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_task/presentation/screens/meetup/meetup_detail_screen.dart';

class TrendingMeetupCard extends StatelessWidget {
  const TrendingMeetupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          final imageUrl = 'https://picsum.photos/800/${400 + index}';
          return GestureDetector(
            onTap: () {
              Get.to(() => const MeetupDetailScreen());
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  height: 150,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      )),
                  child: Center(
                      child: Text(
                    (index + 1).toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 40),
                  )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
