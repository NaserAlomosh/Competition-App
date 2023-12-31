import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/strings/app_string.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../view_model/cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late bool isVisibilitytext;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  //

  @override
  void initState() {
    passwordController = context.read<SignInCubit>().passwordController;
    emailController = context.read<SignInCubit>().emailController;
    isVisibilitytext = context.read<SignInCubit>().isVisibilitytext;
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Email',
          //   style: AppTextStyles.font20BlacRegular
          //       .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          SizedBox(height: 5.h),
          AppTextFormField(
            controller: emailController,
            hintText: AppStringEN.email,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          // Text(
          //   'Password',
          //   style: AppTextStyles.font20BlacRegular
          //       .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          SizedBox(height: 5.h),
          AppTextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            hintText: AppStringEN.password,
            isObscureText: isVisibilitytext,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisibilitytext = !isVisibilitytext;
                });
              },
              child: Icon(
                isVisibilitytext ? Icons.visibility_off : Icons.visibility,
                size: 16.sp,
              ),
            ),
          ),
          verticalSpace(18),
        ],
      ),
    );
  }
}
