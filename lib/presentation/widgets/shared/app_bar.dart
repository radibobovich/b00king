import 'package:booking/presentation/fonts.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({
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
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              iconSize: 18,
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: AppFonts.appBarTitle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
