// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 226),

      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 226, 226),
        title:Text(
            "Setting",
            style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
          ), 
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.security_rounded)),
              TextButton(onPressed: (){Navigator.of(context).pushNamed("privicy");}, child: Text("Privacy policy",style: TextStyle(color:Colors.black),)),
            ],
          ),
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.sd_outlined)),
              TextButton(onPressed: (){}, child: Text("Send feedback",style: TextStyle(color:Colors.black),)),
            ],
          ),
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.share)),
              TextButton(onPressed: (){}, child: Text("A bout ",style: TextStyle(color:Colors.black),)),
            ],
          ),
          

          
        
        ],),
      ),
     


    );
  }
}