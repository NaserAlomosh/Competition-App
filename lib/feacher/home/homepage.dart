// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last

import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/core/widgets/back.dart';
import 'package:final_project/feacher/ranks/ranks_view.dart';
import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';
import 'package:flutter/material.dart';

import '../comptition/comptition.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => await myOnWillPop(context),
        child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: Text(
              "Welcome ${userModel!.username}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("setting");
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(userModel!.gender == 'male'
                        ? 'imges/man.png'
                        : 'imges/girl 3[74].jpg'),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("settinggg");
                  },
                  icon: Icon(Icons.settings_applications_sharp)),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      AppNavigation().push(context, ComptitionView());
                    },
                    child: Row(
                      children: [
                        Image.asset("imges/noun-versus-player-2977044[84].png"),
                        Text(
                          "Start comptition",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 11, 243, 243))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("imges/noun-training-2417115[83].png"),
                        Text(
                          "Start traning",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 12, 243, 243)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("imges/noun-competitor-4058571[82].png"),
                        Text(
                          "Existing Competitions",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 11, 243, 243))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 1000,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      AppNavigation().push(context, RanksView());
                    },
                    child: Row(
                      children: [
                        Image.asset("imges/noun-competition-4519893[81].png"),
                        Text(
                          "Ranks broud",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 11, 243, 243))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
