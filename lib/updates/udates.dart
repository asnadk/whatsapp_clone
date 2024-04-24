import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/chats/Map.dart';
import 'package:whatsapp_clone_2/constent.dart';
import 'package:whatsapp_clone_2/costume/appbar.dart';
import 'package:whatsapp_clone_2/updates/statusView.dart';

class ScreenUpdate extends StatelessWidget {
  const ScreenUpdate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarone(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("status", style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                  PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, color: KBlack),
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              child: Text('Status privacy', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            ),
          ];
        },
      ),
                ],
              ),
            ),
            const ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"
                        ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add,color: Kwhite,),
                    ),
                  )
                ],
              ),
              title: Text(
                'My status',
               
              ),
              subtitle: Text(
                "Tap to add status updates",
                style: TextStyle(color: Kgrey, letterSpacing: 1),
              ),
            ),
   Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Recent Update',
          style: TextStyle(
           color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Status_view(imageurl: whatsapp[index]["Dp"], name: whatsapp[index]["name"], time: '01:00',),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(whatsapp[index]['Dp']),
                    radius: 25,
                  ),
                  title: Text(whatsapp[index]["name"]),
                  subtitle: Text("$index minutes ago"),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: whatsapp.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 62, 113, 64),
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}
