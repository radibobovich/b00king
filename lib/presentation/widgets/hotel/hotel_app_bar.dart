import 'package:booking/extensions.dart';
import 'package:flutter/cupertino.dart';

class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HotelAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: CupertinoNavigationBar(
        backgroundColor: context.theme.primaryColor,
        border: null,
        middle: const Text('Отель',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(87);
}
