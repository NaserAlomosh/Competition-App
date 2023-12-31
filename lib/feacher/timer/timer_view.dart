import 'dart:async';

import 'package:final_project/core/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/styles/app_text_style.dart';
import '../question/question_view.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  int _timerValue = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Call the function to start the timer
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerValue == 0) {
          timer.cancel();
          // Navigate to the next screen when the timer reaches 0
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const QuestionsScreen()),
          );
        } else {
          setState(() {
            _timerValue--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await myOnWillPop(context),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              '$_timerValue',
              style: AppTextStyles.font32BlueBold.copyWith(fontSize: 60.sp),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
