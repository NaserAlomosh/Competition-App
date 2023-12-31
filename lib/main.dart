import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/auth/accountset.dart';
import 'package:final_project/auth/editprof.dart';
import 'package:final_project/auth/help.dart';
import 'package:final_project/auth/language.dart';
import 'package:final_project/auth/newpass.dart';
import 'package:final_project/auth/Pass.dart';
import 'package:final_project/auth/privicy.dart';
import 'package:final_project/auth/setting.dart';
import 'package:final_project/auth/settinggg.dart';
import 'package:final_project/auth/welcome.dart';
import 'package:final_project/feacher/home/homepage.dart';
import 'package:final_project/feacher/sign_up/view/sign_up_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/verify.dart';
import 'core/theme/colors/app_colors.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  await FirebaseFirestore.instance.collection('questions').doc().set(
    {
      'question': '??????? ?',
      '1': {
        'answer': 'saeed',
        'correct': true,
        'point': 10,
      },
      '2': {
        'answer': 'test',
        'correct': false,
        'point': 0,
      },
      '3': {
        'answer': 'test',
        'correct': false,
        'point': 0,
      },
      '4': {
        'answer': 'test',
        'correct': false,
        'point': 0,
      },
    },
  );

  runApp(const MyApp());
  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 792),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.primaryBlue),
            ),
          ),
          radioTheme: const RadioThemeData(
              fillColor: MaterialStatePropertyAll(AppColors.primaryBlue)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.primaryBlue),
          ),
          primaryColor: AppColors.primaryBlue,
          scaffoldBackgroundColor: Colors.white,
          drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
        ),
        home: const Welcome(),
        routes: {
          "welcome": (context) => const Welcome(),
          "register": (context) => const SignUpView(),
          "homepage": (context) => const HomeView(),
          "setting": (context) => const Setting(),
          "pass": (context) => const Pass(),
          "verify": (context) => const Verify(),
          "newpass": (context) => const Newpass(),
          "editprof": (context) => const Editprof(),
          "language": (context) => const Lunguage(),
          "settinggg": (context) => const Settinggg(),
          "accountset": (context) => const Accountset(),
          "help": (context) => const Help(),
          "privicy": (context) => const Privacy(),
        },
      ),
    );
  }
}



//  {
//       'question': 'How old are you ?',
//       '1': {
//         'answer': '18',
//         'correct': false,
//         'point': 10,
//       },
//       '2': {
//         'answer': '23',
//         'correct': true,
//         'point': 0,
//       },
//       '3': {
//         'answer': '46',
//         'correct': false,
//         'point': 0,
//       },
//       '4': {
//         'answer': '33',
//         'correct': false,
//         'point': 0,
//       },
//     },