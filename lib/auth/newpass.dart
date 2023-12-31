// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Newpass extends StatelessWidget {
  const Newpass({super.key});

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
                "Creat new password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Pleas enter and confirm you new password. "),
              Text("you will need to login after you reset."),
              Container(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("password",style: TextStyle(fontSize: 17),),
                    TextField(
                      obscureText: true,
                      maxLength: 8,
                     decoration: InputDecoration(
                        
                      
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off_outlined)),
                            
                          
                      ),
                    ),
                    Text("Confirm password",style: TextStyle(fontSize: 17),),
                    TextField(
                      obscureText: true,
                      
                     decoration: InputDecoration(
                        
                      
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off_outlined)),
                            
                          
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
                onPressed: () {Navigator.of(context).pushNamed("homepage");},
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.orange[400],
                textColor: Colors.white,
                child: Text("Reaset password "),
              ),
            ],
          ),
        ),
      
      
      ),
    );
  }
}