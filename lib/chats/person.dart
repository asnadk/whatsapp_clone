import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsapp_clone_2/calls/Audio_call.dart';
import 'package:whatsapp_clone_2/calls/video_call.dart';
import 'package:whatsapp_clone_2/chats/Map.dart';
import 'package:whatsapp_clone_2/constent.dart';

class PersonalChat extends StatefulWidget {
  PersonalChat({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
    Color teaGreen = const Color(0xFFD0F0C0);
  List<String> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    final box = await Hive.openBox<List<String>>('messages_box');
    messages = List<String>.from(box.get(widget.index.toString()) ?? []);
    setState(() {});
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      messages.add(message);
      _textEditingController.clear();

      final box = await Hive.openBox<List<String>>('messages_box');
      box.put(widget.index.toString(), messages);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
        backgroundColor: Kwhite,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(whatsapp[widget.index]["Dp"]),
              radius: 20,
            ),
            const SizedBox(width: 8.0),
            Text(
              whatsapp[widget.index]["name"],
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: KBlack,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => video_call(name: whatsapp[widget.index]["name"], image: whatsapp[widget.index]["Dp"]),));
            },
            icon: const Icon(Icons.videocam, color: KBlack),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AudioCall(name:whatsapp[widget.index]["name"] ,image:whatsapp[widget.index]["Dp"]),));
            },
            icon: const Icon(Icons.call, color: KBlack),
          ),
          PopupMenuButton<String>(
            iconColor:KBlack,
            color: Colors.black45,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  child: Text("View Contact",
                      style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child: Text("Media links, and docs",
                      style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child: Text("Search", style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child: Text("Mute notifications",
                      style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child: Text("Disappearing messages",
                      style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child:
                      Text("Wallpaper", style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  child: Text("More", style: TextStyle(color: Colors.white)),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
          height: double.infinity,
        width: double.infinity,
       decoration: const BoxDecoration(
        image: DecorationImage(image:  NetworkImage(
          'https://i.pinimg.com/736x/35/f3/e9/35f3e9c4b86568b4919949a9307da2a9.jpg'
          ),fit: BoxFit.cover)
       ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                   reverse: false,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                    child:
                     Align(
                            alignment: AlignmentDirectional.centerEnd,
                       child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: teaGreen,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(messages[index],style: const TextStyle(fontSize: 15),),
                                const Text("   "),
                                const Icon(Icons.done_all,size: 15,color: Colors.blue,)
                              ],
                          )
                                         ),
                     ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(

                           icon: const ImageIcon(
                              NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/128/3634/3634325.png'),
                              color: Kgrey,
                            ),
                          hintText: 'Message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_file_rounded),
                                color: Kgrey,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.currency_rupee_sharp),
                                color: Kgrey,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt),
                                color: Kgrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {
                        _sendMessage(_textEditingController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
