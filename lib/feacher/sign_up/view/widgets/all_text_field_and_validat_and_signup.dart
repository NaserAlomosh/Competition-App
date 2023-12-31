import 'package:final_project/core/theme/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/strings/app_string.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../view_model/cubit.dart';
import 'password_valodations.dart';

class AllTextFieldAndValiForValidatorSignUp extends StatefulWidget {
  const AllTextFieldAndValiForValidatorSignUp({super.key});

  @override
  State<AllTextFieldAndValiForValidatorSignUp> createState() =>
      _AllTextFieldAndValiForValidatorSignUpState();
}

class _AllTextFieldAndValiForValidatorSignUpState
    extends State<AllTextFieldAndValiForValidatorSignUp> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  List<String> genderMap = ['male', 'female'];
  List<String> listCollege = ['information technology'];
  List<String> listDepartment = [
    'Software engineering',
    'Computer science',
    'Computer information systems'
  ];
  List<String> listYears = ['1', '2', '3', '4'];
  //
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLingth = false;

  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    emailController = context.read<SignUpCubit>().emailController;
    firstNameController = context.read<SignUpCubit>().firstNameController;
    lastNameController = context.read<SignUpCubit>().lastNameController;
    phoneController = context.read<SignUpCubit>().phoneController;

    setupControllerListener();
    super.initState();
  }

  void setupControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLingth = AppRegex.hasMinLength(passwordController.text);
      });
    });
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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AppTextFormField(
                  controller: firstNameController,
                  hintText: 'First name',
                  validator: (text) {
                    if (text == '') {
                      return 'This Field is requerd';
                    }
                  },
                ),
              ),
              horizontalSpace(
                20,
              ),
              Flexible(
                flex: 1,
                child: AppTextFormField(
                  controller: lastNameController,
                  hintText: 'Last name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field is requerd';
                    }
                  },
                ),
              ),
            ],
          ),
          verticalSpace(
            20,
          ),
          AppTextFormField(
            controller: emailController,
            hintText: AppStringEN.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field is requerd';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Not a valid email format';
              }
            },
          ),
          verticalSpace(
            20,
          ),
          AppTextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'It must be in this format : Example1@';
              }
            },
            hintText: AppStringEN.password,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                size: 16.sp,
              ),
            ),
          ),
          verticalSpace(
            18,
          ),
          PasswordValodations(
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasMinLingth: hasMinLingth,
          ),
          verticalSpace(
            18,
          ),
          AppTextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number.';
              }

              // Remove any non-digit characters
              value = value.replaceAll(RegExp(r'\D'), '');

              if (value.length != 10 ||
                  (!value.startsWith('077') &&
                      !value.startsWith('078') &&
                      !value.startsWith('079'))) {
                return 'It must be 10 digits and start with "077," "078," or "079".';
              }
            },
            hintText: 'Phone',
          ),
          verticalSpace(
            18,
          ),
          Row(
            children: [
              horizontalSpace(5),
              Flexible(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'College',
                        style: AppTextStyles.font20BlacRegular
                            .copyWith(fontSize: 12),
                      ),
                      DropdownButton(
                        isExpanded: true,
                        value: context.read<SignUpCubit>().selectedCollege,
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              context.read<SignUpCubit>().selectedCollege =
                                  newValue!;
                            },
                          );
                        },
                        items: listCollege
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTextStyles.font12GrayRegular
                                  .copyWith(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(5),
              Flexible(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department',
                        style: AppTextStyles.font20BlacRegular
                            .copyWith(fontSize: 12),
                      ),
                      DropdownButton(
                        isExpanded: true,
                        value: context.read<SignUpCubit>().selectedDepartment,
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              context.read<SignUpCubit>().selectedDepartment =
                                  newValue!;
                            },
                          );
                        },
                        items: listDepartment
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTextStyles.font12GrayRegular
                                  .copyWith(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(5),
            ],
          ),
          verticalSpace(
            18,
          ),
          Row(
            children: [
              horizontalSpace(5),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University academic year',
                        style: AppTextStyles.font20BlacRegular
                            .copyWith(fontSize: 12),
                      ),
                      DropdownButton(
                        isExpanded: true,
                        value: context.read<SignUpCubit>().selectedYear,
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              context.read<SignUpCubit>().selectedYear =
                                  newValue!;
                            },
                          );
                        },
                        items: listYears
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(40),
              Flexible(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: AppTextStyles.font20BlacRegular
                            .copyWith(fontSize: 12),
                      ),
                      DropdownButton(
                        isExpanded: true,
                        value: context.read<SignUpCubit>().selectedGender,
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              context.read<SignUpCubit>().selectedGender =
                                  newValue!;
                            },
                          );
                        },
                        items: genderMap
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(5),
            ],
          ),
        ],
      ),
    );
  }
}
