import 'package:flutter/material.dart';

import '../../../../core/theme/strings/app_string.dart';
import '../../../../core/theme/styles/app_text_style.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStringEN.byLoggingYouAgreeToOur,
            style: AppTextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: ' ${AppStringEN.termsAndConditions}',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: ' ${AppStringEN.and}',
            style: AppTextStyles.font13GrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' ${AppStringEN.privacyPolicy}',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
