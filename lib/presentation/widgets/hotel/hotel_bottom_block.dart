import 'package:booking/domain/models/hotel.dart';
import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/shared/peculiarities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBlock extends StatelessWidget {
  const BottomBlock({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(17, 20, 0, 0),
          child: Text(
            'Об отеле',
            style: AppFonts.aboutHotelHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 12, 0, 0),
          child:
              Peculiarities(peculiarities: hotel.aboutTheHotel.peculiarities),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 8, 9, 0),
          child: Text(
            hotel.aboutTheHotel.description,
            style: AppFonts.hotelDescription,
          ),
        ),
        const DetailsButtons(),
      ]),
    );
  }
}

class DetailsButtons extends StatelessWidget {
  const DetailsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: context.color.itemBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            DetailItem(
                icon: SvgPicture.asset(
                  'assets/icons/emoji-happy.svg',
                ),
                name: 'Удобства',
                value: 'Самое необходимое'),
            const Divider(indent: 50, endIndent: 16, thickness: 1),
            DetailItem(
              icon: SvgPicture.asset('assets/icons/tick-square.svg'),
              name: 'Что включено',
              value: 'Самое необходимое',
            ),
            const Divider(indent: 50, endIndent: 16, thickness: 1),
            DetailItem(
              icon: SvgPicture.asset('assets/icons/close-square.svg'),
              name: 'Что не включено',
              value: 'Самое необходимое',
            ),
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });
  final SvgPicture icon;
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.8, horizontal: 14),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppFonts.detailName,
                ),
                Text(
                  value,
                  style: AppFonts.detailValue,
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/arrow_right.svg'),
          ],
        ),
      ),
    );
  }
}
