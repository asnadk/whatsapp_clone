
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone_2/constent.dart';

// ignore: must_be_immutable
class video_call extends StatelessWidget {
  String name;
  String image;
  video_call({super.key, required this.name, required this.image, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Image.network(
              'https://i.pinimg.com/originals/97/c0/07/97c00759d90d786d9b6096d274ad3e07.png'
              ),
          Column(
            children: [
              KHeight30,
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Icon(
                    Icons.lock,
                    color: Kgrey,
                    size: 15,
                  ),
                  kWidth10,
                  Text(
                    "End-to-end encrypted",
                    style: TextStyle(color: Kgrey, letterSpacing: 1),
                  ),
                  Spacer(),
                  Icon(
                    Icons.person_add,
                    color: Kwhite,
                  ),
                  KHeight30,
                ],
              ),
              KHeight30,
             
              KHeight30,
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20, color: Kwhite, letterSpacing: 1),
              ),
              // Kheight10,
              const Text(
                "Ringing",
                style: TextStyle(color: Kgrey, letterSpacing: 1),
              ),
              const SizedBox(
                height: 500,
              ),
              Expanded(
                child: Container(
                  color: Colors.black38,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Icon(Icons.flip_camera_ios,color: KBlack,size: 32,),
                      const Icon(Icons.mobile_screen_share,color: Colors.black38,size: 32,),
                      const Icon(Icons.videocam_off,color: KBlack,size: 32,),
                       const Icon(Icons.mic_off,color: KBlack,size: 32,),

                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.call_end,color: Kwhite,)),
                      )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}