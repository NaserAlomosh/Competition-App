import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/feacher/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/colors/app_colors.dart';
import '../../../core/theme/styles/app_text_style.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/my_loading.dart';
import '../../sign_in/view/sign_in.dart';
import '../view_model/cubit.dart';
import '../view_model/states.dart';
import 'widgets/all_text_field_and_validat_and_signup.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(100.0.h), // Set your preferred height here
          child: PreferredSize(
            preferredSize:
                Size.fromHeight(100.0.h), // Set your preferred height here
            child: AppBar(
              leading: const SizedBox(),
              elevation: 5,

              // Set title to null, as we'll use the custom text widget
              bottom: const PreferredSize(
                preferredSize:
                    Size.fromHeight(50.0), // Set your preferred height here
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              // Other AppBar properties can be set here
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: AppColors.primaryBlue,
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  verticalSpace(20),
                  const AllTextFieldAndValiForValidatorSignUp(),
                  verticalSpace(20),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) async {
                      if (state is SignUpLoadingState) {
                        return showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (context) => Center(
                            child: myLoadingIndicator(),
                          ),
                        );
                      } else if (state is SignUpErrorState) {
                        setupErrorState(context, state.message);
                      } else {
                        AppNavigation()
                            .pushReplacement(context, const HomeView());
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        border: false,
                        buttonText: 'Create Account',
                        textStyle: AppTextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          context.read<SignUpCubit>().signUpCubit();
                        },
                      );
                    },
                  )

                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
