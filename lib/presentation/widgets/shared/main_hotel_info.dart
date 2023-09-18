import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/hotel/hotel_top_block.dart';
import 'package:flutter/material.dart';

class MainHotelInfo extends StatelessWidget {
  const MainHotelInfo({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.hotelName,
    required this.address,
  });

  final int rating;
  final String ratingName;
  final String hotelName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rating(
          rating: rating,
          ratingName: ratingName,
        ),
        Text(
          hotelName,
          style: AppFonts.hotelName,
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(7),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            address,
            style: AppFonts.hotelAddress,
          ),
        ),
      ],
    );
  }
}
