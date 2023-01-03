import 'package:flutter/material.dart';

class AppBarImplements extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarImplements({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      leading: IconButton(
        icon: const Icon(Icons.backspace),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
