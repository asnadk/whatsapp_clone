import 'package:flutter/material.dart';
import 'package:whatsapp_clone_2/constent.dart';

// ignore: must_be_immutable, camel_case_types
class Status_view extends StatelessWidget {
  final String imageurl;
  final String name;
  String time;
   Status_view({super.key ,required this.imageurl,required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back,color: Kwhite,)),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
              kWidth10,
              Column(
                children: [
                  Text(name,style: const TextStyle(fontSize: 20,color: Kwhite),),
                  Text(time,style: const TextStyle(fontSize: 18,color: Kwhite),)
                ],
              )
            ],
          ),
          actions: const [
            Icon(Icons.more_vert,color: Kwhite,size: 32,)
          ],
          backgroundColor: KBlack,
        ),
      body:  Container(
        color: KBlack,
        child:  Column(
          children: [
              Container(
                height: 600,
                width: 400,
                // color: Kwhite,
                child: Image.network(imageurl,fit: BoxFit.cover,),
              ),
              Kheight20,
              Container(
                height: 40,
                width: 400,
                decoration:  BoxDecoration(
                   color: const Color.fromARGB(76, 236, 234, 234),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Row(
                  children: [
                    kWidth10,
                    Text("Reply",style: TextStyle(color: Kwhite,fontSize:17 ),),
                  ],
                )),
              )
          ],
        ),
      ),
      
      ),
    );
  }
}