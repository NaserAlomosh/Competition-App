// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/core/widgets/back.dart';
import 'package:final_project/feacher/sign_in/view/sign_in.dart';
import 'package:final_project/feacher/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await myOnWillPop(context),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Image.asset(
                'imges/welcome.png',
                height: 200,
                width: 200,
              ),
              Expanded(child: SizedBox()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          AppNavigation().push(context, SignUpView());
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(44))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16))),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          AppNavigation().push(context, SigninView());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(44))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16))),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "login");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 14.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      "Continuo without login",
                      style: TextStyle(color: Color.fromARGB(255, 168, 78, 78)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
