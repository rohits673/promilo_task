import 'dart:io';
import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/meetup/image_carousel.dart';

class MeetupDetailScreen extends StatelessWidget {
  const MeetupDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppinioSocialShare appinioSocialShare = AppinioSocialShare();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetup Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _buildIconRow(appinioSocialShare),
                  const ImageCarousel(overlay: false),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.bookmark,
                    size: 16,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('1034'),
                  const SizedBox(width: 20),
                  const Icon(
                    FontAwesomeIcons.heart,
                    size: 16,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("1034"),
                  const SizedBox(width: 20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Wrap(
                      spacing: 1,
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < 3
                              ? Colors.cyan
                              : index == 3
                                  ? Colors.cyan[100]
                                  : Colors.white,
                          size: 14,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Center(
                    child: Text(
                      '3.2',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actor Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Indian Actress'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text('Duration 20 Mins'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.wallet,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text('Total Average Fees ₹9,999'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildIconRow(AppinioSocialShare appinioSocialShare) {
  return Column(
    children: [
      const AspectRatio(aspectRatio: 1.38, child: SizedBox()),
      Container(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(FontAwesomeIcons.download, size: 20),
            const Icon(FontAwesomeIcons.bookmark, size: 20),
            const Icon(FontAwesomeIcons.heart, size: 20),
            const Icon(FontAwesomeIcons.expand, size: 20),
            const Icon(FontAwesomeIcons.star, size: 20),
            InkWell(
                onTap: () async {
                  try {
                    if (Platform.isAndroid) {
                      await appinioSocialShare.android.shareToSystem(
                          "Check out this awesome meetup", "message", null);
                    } else if (Platform.isIOS) {
                      await appinioSocialShare.iOS
                          .shareToSystem("Check out this awesome meetup");
                    } else {}
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                },
                child: const Icon(FontAwesomeIcons.shareNodes, size: 20)),
          ],
        ),
      ),
    ],
  );
}
