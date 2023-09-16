import 'package:booking/extensions.dart';
import 'package:booking/fonts.dart';
import 'package:flutter/material.dart';

class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HotelAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
      title: Text(title, style: AppFonts.appBarTitle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
