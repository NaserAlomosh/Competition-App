import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors/app_colors.dart';
import '../theme/styles/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    required this.validator,
    this.controller,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      cursorColor: AppColors.primaryBlue,
      controller: controller,
      validator: (value) {
        return validator!(value);
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 12.0.sp,
        ),
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        hintStyle: hintStyle ?? AppTextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: Align(
          widthFactor: 2.0,
          child: suffixIcon,
        ),
        suffixIconColor: AppColors.primaryBlue,
        fillColor: backgroundColor ?? AppColors.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14DarkBlueMedium,
    );
  }
}
