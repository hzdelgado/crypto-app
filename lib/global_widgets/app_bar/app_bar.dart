import 'package:flutter/material.dart';

class CryptoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? body;
  const CryptoAppBar({Key? key, this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: body ??
          Text(
            title?? "",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
