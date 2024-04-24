import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/constent.dart';

class ArchivedScreen extends StatelessWidget {
  final List<String> archivedChats;

  const ArchivedScreen({
    Key? key, required this.archivedChats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Kwhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color:KBlack,
          ),
        ),
        title: const Text(
          'Archived',
          style: TextStyle(color: KBlack, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: KBlack,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Text(
                'These chats stay archived when new messages are received. Tap to change',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Divider(),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       onTap: () {},
            //       leading: const CircleAvatar(
            //         radius: 30,
            //       ),
            //       title: Text(
            //         archivedChats[index], 
            //         style: const TextStyle(color: Colors.white),
            //       ),
            //       subtitle: const Text('data', style: TextStyle(color: Colors.grey)),
            //       trailing: const Text('17:57', style: TextStyle(color: Colors.grey)),
            //       minVerticalPadding: 25,
            //     );
            //   },
            //   itemCount: archivedChats.length, 
            // ),
            // const Divider(
            //   color: Colors.teal,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 15, color: Colors.grey),
                kWidth10,
                Text('Your personal messages are',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 11, letterSpacing: 1)),
                Text(' end-to-end encrypted',
                    style: TextStyle(
                        color: Colors.green, fontSize: 11, letterSpacing: 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}