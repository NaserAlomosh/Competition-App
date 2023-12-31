import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';

class PasswordValodations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLingth;
  const PasswordValodations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLingth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lawercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 has upper case letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
          'At least 1 has special characters letter',
          hasSpecialCharacters,
        ),
        verticalSpace(2),
        buildValidationRow('At least 1 number ', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long ', hasMinLingth),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: hasValidated ? Colors.green : AppColors.darkBlue,
          radius: 2.5.sp,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: AppTextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.gray : AppColors.darkBlue,
          ),
        )
      ],
    );
  }
}
