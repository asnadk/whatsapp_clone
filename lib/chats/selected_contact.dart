import 'package:flutter/material.dart';

class SelectedContact extends StatelessWidget {
  const SelectedContact({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
IconButton( icon: const Icon(Icons.search,color: Colors.white,),onPressed: (){},),
IconButton( icon: const Icon(Icons.more_vert, color: Colors.white,),onPressed: (){},)

       
        ],

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selected Contact', style: TextStyle(fontSize: 15,color: Colors.white),),
          Title(color: Colors.white, child: const Text('10 Contact', style: TextStyle(fontSize: 10, color: Colors.white,),))
          ],
          
        ),
        
        backgroundColor: const Color.fromARGB(255, 62, 113, 64),
        
        
      )
      ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.group, color: Colors.white,),
                  radius: 20,
                  backgroundColor: Colors.teal,
                  
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('New Group'),
                )
              ],
              
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.contact_emergency_rounded, color: Colors.white,),
                  radius: 20,
                  backgroundColor: Colors.teal,
                  
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('New Contact'),
                ),
                SizedBox(width: 200),
                Icon(Icons.qr_code)
              ],
              
              
            ),
             const SizedBox(height: 15),
            const Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.groups_2, color: Colors.white,),
                  radius: 20,
                  backgroundColor: Colors.teal,
                  
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('New Community'),
                )
              ],
            ),
                        const SizedBox(height: 15,),

            const Align(
              alignment: Alignment.centerLeft,
            child:Text('Contact on whatsApp')
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.account_circle, color: Colors.white,),
                    ),
                    title: Text('Contact$index'),
                    onTap: (){

                    },
                  );
                },
                ),
            )
          ],
         
        ),
      ),
    );
  }
}