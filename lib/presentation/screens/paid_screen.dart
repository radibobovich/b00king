import 'dart:math';

import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/theme.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/shared/bottom_button_sheet.dart';
import 'package:flutter/material.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.blockBackgroundColor,
      appBar: const SharedAppBar(title: 'Заказ оплачен'),
      bottomSheet: BottomButtonSheet(
        buttonText: 'Супер!',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              radius: 50,
              // TODO: use SVG
              child: Image.asset(
                'assets/icons/party-popper.png',
                scale: 1.5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child:
                  Text('Ваш заказ принят в работу', style: AppFonts.hotelName),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                '''Подтверждение заказа №${Random().nextInt(100000) + 100000} может занять некоторое время (от 1 часа до суток). '''
                '''Как только мы получим ответ от туроператора, вам на почту придет уведомление.''',
                textAlign: TextAlign.center,
                // style: AppFonts.paidLabel,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProDisplay400',
                  color: AppTheme.appColors.secondaryTextColor,
                  height: 1.2,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
