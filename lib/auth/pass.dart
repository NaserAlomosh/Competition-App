// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Pass extends StatelessWidget {
  const Pass({super.key});

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
                "Forget Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Dont worry! Enter your email address below and we  "),
              Text("will send you a code to reset password"),
              Container(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                height: 100,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("verify");
                },
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.orange[400],
                textColor: Colors.white,
                child: Text("Send code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
