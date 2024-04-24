import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/calls/Audio_call.dart';
import 'package:whatsapp_clone_2/chats/Map.dart';
import 'package:whatsapp_clone_2/constent.dart';
import 'package:whatsapp_clone_2/costume/appbar.dart';

class ScreenCalls extends StatelessWidget {
  ScreenCalls({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarone(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                 CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 30,
                  child: Image.network('https://cdn-icons-png.flaticon.com/128/9762/9762302.png',width: 30,height: 40,),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create call Links',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Share a link for your WhatsApp call',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
           const SizedBox(height: 10),
    const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Recent',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
          
          Expanded(
            child: ListView.builder(
              itemCount: whatsapp.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(whatsapp[index]['Dp']),
                  ),
                  title: Text(whatsapp[index]['name']),
                  subtitle: const Row(
                    children: [
                       Icon(Icons.north_east, size:18,color:  Colors.green,),
                      Text('12:34 PM'),
                     
                    ],
                  ),
                  trailing: const Icon(Icons.call),
                  
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AudioCall(name: whatsapp[index]['name'], image:whatsapp[index]['Dp']),));
                  },
                );
              },
            ),
          ),
        ],
      ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.green,
        onPressed: () {
        },
        child: const Icon(Icons.add_call,color: Kwhite,),
       ),
    );
  }
}
