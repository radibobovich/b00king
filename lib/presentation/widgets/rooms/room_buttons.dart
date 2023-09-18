import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectRoomButton extends StatelessWidget {
  const SelectRoomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.adaptiveWidth * 0.92,
      height: 51,
      child: CupertinoButton(
          color: AppTheme.appColors.addressColor,
          borderRadius: BorderRadius.circular(15),
          onPressed: () => Navigator.of(context).pushNamed('/booking'),
          child: Text(
            'Выбрать номер',
            style: AppFonts.buttonLabel,
          )),
    );
  }
}

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.color.anyRatingBackgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Подробнее о номере ',
              style:
                  AppFonts.ratingLabel(color: context.color.anyRatingTextColor),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: context.color.anyRatingTextColor,
            )
          ],
        ),
      ),
    );
  }
}
