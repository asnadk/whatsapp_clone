import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/constent.dart';

class AppBarone extends StatelessWidget implements PreferredSizeWidget {
  const AppBarone({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontFamily: 'Helvetica Neue',
          ),
        ),
        backgroundColor: Kwhite,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            color: KBlack,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: KBlack,
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: KBlack),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  child: Text('New group'),
                ),
                const PopupMenuItem<String>(
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem<String>(
                  child: Text('Linked devices'),
                ),
                const PopupMenuItem<String>(
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem<String>(
                  child: Text('Payments'),
                ),
                const PopupMenuItem<String>(
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ],
      );
  }
}