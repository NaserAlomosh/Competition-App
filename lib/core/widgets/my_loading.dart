import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

Widget myLoadingIndicator() {
  if (Platform.isAndroid) {
    return const CircularProgressIndicator(
      color: AppColors.primaryBlue,
    );
  } else {
    return const CupertinoActivityIndicator();
  }
}
