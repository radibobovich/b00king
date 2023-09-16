import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:flutter/material.dart';

class Peculiarities extends StatelessWidget {
  const Peculiarities({super.key, required this.peculiarities});
  final List<String> peculiarities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.fromLTRB(17, 12, 0, 0),
      padding: EdgeInsets.zero,
      child: Wrap(
        children: peculiarities.map((e) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // margin: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 4),
            margin: const EdgeInsets.fromLTRB(0, 4.5, 8, 4.5),
            decoration: BoxDecoration(
              color: context.color.itemBackgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),

            /// Peculiarity
            child: Text(
              e,
              style: AppFonts.peculiarity,
            ),
          );
        }).toList(),
      ),
    );
  }
}
