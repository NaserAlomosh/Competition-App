import 'package:flutter/material.dart';

import '../../../../core/theme/strings/app_string.dart';
import '../../../../core/theme/styles/app_text_style.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStringEN.dontHaveAnAccount,
            style: AppTextStyles.font13DarkBlueRegular,
          ),
          GestureDetector(
            onTap: () {
              // context.pushNamed(Routes.signupScreen);
            },
            child: Text(
              AppStringEN.signUp,
              style: AppTextStyles.font13BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
