// ignore_for_file: use_build_context_synchronously

import 'package:final_project/auth/welcome.dart';
import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/theme/styles/app_text_style.dart';

class Settinggg extends StatefulWidget {
  const Settinggg({super.key});

  @override
  State<Settinggg> createState() => _SettingggState();
}

class _SettingggState extends State<Settinggg> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 226, 226),
        title: const Text(
          "Setting",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.account_circle)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("accountset");
                    },
                    child: const Text(
                      "Account Setting",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Notification Setting",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Share App",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.star_half)),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Rate App",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline_sharp)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("help");
                    },
                    child: const Text(
                      "Help",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            const Text("____________________________________________________"),
            isLoading
                ? const Column(
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await FirebaseAuth.instance.signOut().then((_) {
                                AppNavigation()
                                    .pushReplacement(context, const Welcome());
                              });
                            } on FirebaseAuthException catch (e) {
                              setupErrorBack(context, e.message ?? 'Error');
                            }
                          },
                          icon: const Icon(Icons.logout)),
                      TextButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await FirebaseAuth.instance.signOut().then((_) {
                                AppNavigation()
                                    .pushReplacement(context, const Welcome());
                              });
                            } on FirebaseAuthException catch (e) {
                              setupErrorBack(context, e.message ?? 'Error');
                            }
                          },
                          child: const Text(
                            "Log out",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

void setupErrorBack(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppTextStyles.font14DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}
