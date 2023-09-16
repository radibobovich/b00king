import 'dart:math';

import 'package:booking/extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.imageUrls});
  final List<String> imageUrls;
  // TODO: pre-load images
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPosition = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: CarouselSlider(
            carouselController: _controller,
            items: widget.imageUrls.map((image) {
              return Image.network(image, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 272,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPosition = index;
                });
              },
            )),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.imageUrls.asMap().entries.map((e) {
              final double lerpFactor = sqrt(
                  ((_currentPosition - e.key).toDouble() /
                          widget.imageUrls.length)
                      .abs());
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.5),
                child: CircleAvatar(
                  radius: 3.5,
                  backgroundColor: e.key == _currentPosition
                      ? Colors.black
                      : Color.lerp(Colors.black, Colors.white, lerpFactor),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ]);
  }
}
