import 'package:flutter/material.dart';

Future<void> precacheGallery(
    List<String> imageUrls, BuildContext context) async {
  for (var img in imageUrls) {
    await precacheImage(NetworkImage(img), context)
        .onError((error, stackTrace) => null);
  }
}
