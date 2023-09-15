import 'package:booking/domain/models/hotel.dart';
import 'package:booking/extensions.dart';
import 'package:booking/presentation/widgets/shared/image_carousel.dart';
import 'package:flutter/material.dart';

class TopBlock extends StatelessWidget {
  const TopBlock({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Align(
        alignment: AlignmentDirectional.center,

        // child: SizedBox(
        //   width: context.adaptiveWidth * 0.92,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              ImageCarousel(imageUrls: hotel.imageUrls),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: MainInfo(hotel: hotel),
              ),
              const SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rating(
          rating: hotel.rating,
          ratingName: hotel.ratingName,
        ),
        const Text(
          // TODO: replace with actual data
          'Steigenberger Makadi',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(7),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            hotel.address,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: context.color.addressColor),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(17),
        ),
        PriceRow(
          minimalPrice: hotel.minimalPrice,
          priceForIt: hotel.priceForIt,
        )
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow(
      {super.key, required this.minimalPrice, required this.priceForIt});
  final int minimalPrice;
  final String priceForIt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// TODO: replace with actual data
        const Text(
          'от 134 673 ₽',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        // TODO: replace with actual data
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text(
            'за тур с перелётом',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: context.color.secondaryTextColor,
            ),
          ),
        )
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating, required this.ratingName});
  final int rating;
  final String ratingName;
  // TODO: different color for different ratings
  @override
  Widget build(BuildContext context) {
    final textColor = false
        ? context.color.bestRatingTextColor
        : context.color.anyRatingTextColor;
    final backgroundColor = false
        ? context.color.bestRatingBackgroundColor
        : context.color.anyRatingBackgroundColor;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 9),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            color: textColor,
            size: 18,
          ),
          Text(
            '${rating.toString()} $ratingName',
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
