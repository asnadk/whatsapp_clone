import 'package:flutter/material.dart';

class AppBarWidgetTwo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidgetTwo({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {},
          color: Colors.white,
        ),
       
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
          color: Colors.white,
        ),
      ],
      title: const Text(
        'WhatsApp',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 62, 113, 64),
    );
  }
}