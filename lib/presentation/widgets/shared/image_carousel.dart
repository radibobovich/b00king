import 'dart:math';

import 'package:booking/extensions.dart';
import 'package:booking/utils/image_preloader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.imageUrls});
  final List<String> imageUrls;
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPosition = 0;
  final CarouselController _controller = CarouselController();
  final List<Image> _images = [];

  @override
  void initState() {
    super.initState();
    populateImagesList();
  }

  @override
  void didChangeDependencies() {
    /// Pre-download all images in the gallery
    precacheGallery(widget.imageUrls, context);
    super.didChangeDependencies();
  }

  ///
  void populateImagesList() {
    for (var url in widget.imageUrls) {
      final Image image;
      final key = UniqueKey();
      image = Image.network(
        key: key,
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },

        /// Removes bad images seamlessly during scroll
        errorBuilder: (context, error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _images.removeWhere((image) => image.key == key);
            });
          });

          return const Icon(Icons.image_not_supported);
        },
      );
      _images.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: CarouselSlider(
            carouselController: _controller,
            items: _images,
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
            children: _images.asMap().entries.map((e) {
              final double lerpFactor = sqrt(
                  ((_currentPosition - e.key).toDouble() / _images.length)
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
