import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/core/theme/styles/app_text_style.dart';
import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../timer/timer_view.dart';

class VsView extends StatefulWidget {
  const VsView({super.key});

  @override
  State<VsView> createState() => _VsViewState();
}

class _VsViewState extends State<VsView> {
  @override
  Widget build(BuildContext context) {
    goToQU();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: SizedBox(
                            child: Image.asset(
                              userModel!.gender == 'male'
                                  ? 'imges/man.png'
                                  : 'imges/girl 3[74].jpg',
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          userModel!.username!,
                          style: AppTextStyles.font26BlueBold.copyWith(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.all(20.0),
                  //
                  child: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToQU() {
    FirebaseFirestore.instance.collection('competition').get().then(
      (docSnapshot) {
        if (docSnapshot.docs.length == 2) {
          AppNavigation().pushReplacement(context, const TimerScreen());
          // Both players are ready, start countdown
        } else {
          goToQU();
        }
      },
    );
  }
}
