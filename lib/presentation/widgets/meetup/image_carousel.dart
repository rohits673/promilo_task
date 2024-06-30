import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final bool overlay;
  const ImageCarousel({super.key, this.overlay = true});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _pageController;
  final int _carouselLength = 3;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: widget.overlay ? 16 / 9 : 4 / 3,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _carouselLength,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _CarouselImage(
                    url: 'https://picsum.photos/800/${400 + index}',
                    overlay: widget.overlay,
                  );
                },
              ),
              if (!widget.overlay)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: _DotIndicator(
                    currentIndex: _currentPage,
                    itemCount: _carouselLength,
                  ),
                ),
            ],
          ),
        ),
        if (widget.overlay) ...[
          const SizedBox(height: 10),
          _DotIndicator(
            currentIndex: _currentPage,
            itemCount: _carouselLength,
          ),
        ],
      ],
    );
  }
}

class _CarouselImage extends StatelessWidget {
  final String url;
  final bool overlay;

  const _CarouselImage({
    required this.url,
    required this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        if (overlay)
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Popular Meetups in India",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const _DotIndicator({
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
