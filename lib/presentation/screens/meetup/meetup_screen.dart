import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/meetup/image_carousel.dart';
import '../../widgets/meetup/search_bar_widget.dart';
import '../../widgets/meetup/trending_people_card.dart';
import '../../widgets/meetup/trending_meetup_card.dart';

class MeetupScreen extends StatelessWidget {
  const MeetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Meetup'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            SearchBarWidget(),
            SizedBox(height: 20),
            ImageCarousel(),
            SizedBox(height: 20),
            _SectionTitle(title: 'Trending Popular People'),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TrendingPeopleCard(
                    title: 'Author',
                    subtitle: '1,028 Meetups',
                    icon: FontAwesomeIcons.penNib,
                    imageUrlTemplate:
                        'https://randomuser.me/api/portraits/men/',
                  ),
                  TrendingPeopleCard(
                    title: 'Mentor',
                    subtitle: '728 Meetups',
                    icon: FontAwesomeIcons.brain,
                    imageUrlTemplate:
                        'https://randomuser.me/api/portraits/women/',
                  ),
                  TrendingPeopleCard(
                    title: 'Trainer',
                    subtitle: '528 Meetups',
                    icon: FontAwesomeIcons.dumbbell,
                    imageUrlTemplate:
                        'https://randomuser.me/api/portraits/men/',
                    imageIndexOffset: 50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _SectionTitle(title: 'Top Trending Meetups'),
            SizedBox(height: 10),
            TrendingMeetupCard(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
