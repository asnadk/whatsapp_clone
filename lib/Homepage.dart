import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/calls/Screen_calls.dart';
import 'package:whatsapp_clone_2/chats/chats.dart';
import 'package:whatsapp_clone_2/communitie.dart';
import 'package:whatsapp_clone_2/costume/bottom_navigation.dart';
import 'package:whatsapp_clone_2/updates/udates.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key});
final _pages = [
  const ChatScreen(), 
  const ScreenUpdate(),
  const ScreenCommunity(),
  ScreenCalls(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexChangeNotifire,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const bottomNavigationWidget(),
    );
  }
}