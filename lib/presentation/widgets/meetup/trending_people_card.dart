import 'package:flutter/material.dart';

class TrendingPeopleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String imageUrlTemplate;
  final int imageIndexOffset;

  const TrendingPeopleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.imageUrlTemplate,
    this.imageIndexOffset = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 16),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: List.generate(5, (index) {
                    return Positioned(
                      left: index * 40.0,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          '$imageUrlTemplate${index + imageIndexOffset}.jpg',
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'See more',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
