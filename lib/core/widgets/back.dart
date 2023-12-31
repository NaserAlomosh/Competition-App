import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

Future<bool> myOnWillPop(BuildContext context) async {
  // Display exit confirmation dialog
  bool exit = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Exit App'),
        content: Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Don't exit
            },
            child: Text(
              'No',
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Exit
            },
            child: Text(
              'Yes',
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ),
        ],
      );
    },
  );

  return exit;
}
