// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: const Color.fromARGB(255, 230, 226, 226),
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verify Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Code has been send to your Email "),
              Text("Enter the code to verify your account"),
              Container(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter code",style: TextStyle(fontSize: 17),),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "4 Digit code ",
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                
                  
                ),
              ),
              Container(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Didnt receive code!"),
                  Text("Resend Code",style: TextStyle(color: Colors.blue),),
                ],
                
              ),
              Text("Resend code in 00:59"),
              Container(height: 100,),
              MaterialButton(
                onPressed: () {Navigator.of(context).pushNamed("newpass");},
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.orange[400],
                textColor: Colors.white,
                child: Text("Verify account "),
              ),
            ],
          ),
        ),
      
      
      ),
    );
  }
}