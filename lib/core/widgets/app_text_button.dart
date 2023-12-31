import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/colors/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? shadowBorderRadius;
  final Color? colorShadow;

  final IconData? iconWithText;

  final bool border;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.shadowBorderRadius,
    this.colorShadow,
    this.iconWithText,
    this.border = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: shadowBorderRadius ?? BorderRadius.circular(30.sp),
        border: border ? Border.all(color: Colors.black) : null,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30.0.sp),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? AppColors.primaryBlue,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            Size(
              buttonWidth?.w ?? double.maxFinite,
              buttonHeight ?? 46.sp,
            ),
          ),
        ),
        onPressed: onPressed,
        child: iconWithText != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    iconWithText,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  Text(buttonText, style: textStyle),
                ],
              )
            : Text(
                buttonText,
                style: textStyle,
              ),
      ),
    );
  }
}
