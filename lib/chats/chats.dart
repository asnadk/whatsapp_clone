import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/chats/ArchivedScreen.dart';
import 'package:whatsapp_clone_2/chats/Map.dart';
import 'package:whatsapp_clone_2/chats/person.dart';
import 'package:whatsapp_clone_2/chats/selected_contact.dart';
import 'package:whatsapp_clone_2/constent.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredChats = List.from(whatsapp);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

void _onSearchChanged() {
  String query = _searchController.text.toLowerCase();
  setState(() {
    _filteredChats = whatsapp.where((chat) {
      return chat["name"].toLowerCase().contains(query) ||
          chat["recent"].toLowerCase().contains(query);
    }).toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search chats...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalChat(
                          index: index,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(_filteredChats[index]["Dp"]!),
                  ),
                  title: Text(
                    _filteredChats[index]["name"]!,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    _filteredChats[index]["recent"]!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _filteredChats[index]["time"]!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Kheight10,
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 8, color: Kwhite),
                        ),
                      )
                    ],
                  ),
                  minVerticalPadding: 25,
                );
              },
              itemCount: _filteredChats.length,
            ),
            Container(
              color: Kwhite,
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ArchivedScreen(archivedChats: ['']), 
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        color: KBlack,
                      ),
                      kWidth10,
                      Text('Archived', style: TextStyle(color:KBlack,fontWeight: FontWeight.w700,fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.lock,size: 15,),
              kWidth10,
              Text('Your Personal messages are ',style: TextStyle(
               fontSize: 12
              ),),
              Text('end-to-end encrypted',style: TextStyle(
                color: Colors.green,
                               fontSize: 12

              ),)
            ],),

            const SizedBox(
              height: 300,
              width: double.infinity,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectedContact()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat, color: Kwhite),
      ),
    );
  }

  AppBar _appbar() {
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
