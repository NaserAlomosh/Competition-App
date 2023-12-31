import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/core/theme/colors/app_colors.dart';
import 'package:final_project/feacher/home/homepage.dart';
import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';
import 'package:flutter/material.dart';

import '../../core/theme/styles/app_text_style.dart';

class Result extends StatefulWidget {
  final int points;

  const Result({super.key, required this.points});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isLoading = true;

  @override
  void initState() {
    if (userModel!.point != null) {
      userModel!.point = userModel!.point! + widget.points;
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.id)
        .set(userModel!.toMap())
        .then((value) {
      setState(() {
        isLoading = false;
      });
    }).then((value) {
      getUserData(id: userModel!.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.home),
        onPressed: () {
          AppNavigation().pushReplacement(context, const HomeView());
        },
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColors.primaryBlue,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Your Points', style: AppTextStyles.font32BlueBold),
                  Text(
                    '${widget.points}',
                    style: AppTextStyles.font32BlueBold,
                  ),
                ],
              ),
      ),
    );
  }
}

class ResultModel {
  String? id;
  String? name;
  ResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
