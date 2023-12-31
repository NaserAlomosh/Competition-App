import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/theme/styles/app_text_style.dart';
import 'package:final_project/core/widgets/app_text_button.dart';
import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';
import 'package:final_project/feacher/vs/vs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/navigation/app_navigation.dart';

class ComptitionView extends StatefulWidget {
  const ComptitionView({super.key});

  @override
  State<ComptitionView> createState() => _ComptitionViewState();
}

class _ComptitionViewState extends State<ComptitionView> {
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Challenging questions',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 4, // Add elevation to create a shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10), // Adjust the border radius as needed
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ), // ClipRRect to apply border radius to the image
              child: Image.asset(
                'assets/comp.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Are you ready to start the competition?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The competition consists of 20 questions. Each correct question receives 5 points',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  AppTextButton(
                    buttonText: 'Start competition',
                    textStyle: AppTextStyles.font16WhiteMedium,
                    onPressed: () {
                      getLengthPlayers(context);
                    },
                    border: false,
                  ),
                ],
              ),
            ),
          ),
          isReady
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      'Search',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                    SizedBox(height: 30.h),
                    const CircularProgressIndicator(),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.asset(
                                  userModel!.gender == 'male'
                                      ? 'imges/man.png'
                                      : 'imges/girl 3[74].jpg',
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              userModel!.username!,
                              style: AppTextStyles.font14DarkBlueMedium,
                            ),
                          ],
                        ),
                        Text('VS', style: AppTextStyles.font26BlueBold),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.asset(
                                  'imges/default.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '?',
                              style: AppTextStyles.font14DarkBlueMedium,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }

  getLengthPlayers(BuildContext context) async {
    setState(() {
      isReady = !isReady;
    });
    var competition = FirebaseFirestore.instance.collection('competition');
    await competition.get().then((value) async {
      if (value.docs.length < 2) {
        await competition.doc(userModel!.id).set({
          'id': userModel!.id,
          'name': userModel!.username,
        }).then((value) {
          AppNavigation().push(context, const VsView());
        });
      } else {
        competition.get().then((value) async {
          for (var element in value.docs) {
            await FirebaseFirestore.instance
                .collection('competition')
                .doc(element.id)
                .delete()
                .then((value) {
              AppNavigation().push(context, const VsView());
            });
          }
          await competition.doc(userModel!.id).set({
            'id': userModel!.id,
            'name': userModel!.username,
          });
        });
      }
    });
  }
}
