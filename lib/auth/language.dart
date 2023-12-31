// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Lunguage extends StatelessWidget {
  const Lunguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 226),
       
       appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 226, 226),
        
        title:Text("Language ",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
       ),
       body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Suggested",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text("English"),
            SizedBox(height: 20,),
            Text("Arabic"),
            
          ],
         ),
       ),
    
    );
  }
}