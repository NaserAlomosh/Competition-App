import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/feacher/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/colors/app_colors.dart';
import '../../../core/theme/strings/app_string.dart';
import '../../../core/theme/styles/app_text_style.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/my_loading.dart';
import '../view_model/cubit.dart';
import '../view_model/states.dart';
import 'widget/email_and_password_validoter.dart';
import 'widget/terms_and_conditions_text.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  late TextEditingController? usernameController;
  late TextEditingController? passwordController;
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: BlocProvider(
          create: (context) => SignInCubit(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(50),
                  Text(
                    'Login',
                    style:
                        AppTextStyles.font22BlackBold.copyWith(fontSize: 26.sp),
                  ),
                  verticalSpace(20),
                  const EmailAndPassword(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStringEN.forgotPassword,
                      style: AppTextStyles.font13BlueRegular,
                    ),
                  ),
                  verticalSpace(20),
                  BlocConsumer<SignInCubit, SignInState>(
                    listener: (context, state) async {
                      if (state is SignInLoadingState) {
                        return showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (context) => Center(
                            child: myLoadingIndicator(),
                          ),
                        );
                      } else if (state is SignInErrorState) {
                        setupErrorState(context, state.message);
                      } else {
                        AppNavigation()
                            .pushReplacement(context, const HomeView());
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        border: false,
                        buttonText: 'Login',
                        textStyle: AppTextStyles.font16WhiteSemiBold
                            .copyWith(fontSize: 16.sp),
                        verticalPadding: 10,
                        onPressed: () {
                          context.read<SignInCubit>().signInCubit(
                                username: usernameController!.text,
                                password: passwordController!.text,
                              );
                        },
                      );
                    },
                  ),
                  verticalSpace(16),
                  const TermsAndConditionsText(),
                  verticalSpace(60),
                  SizedBox(height: 80.h),
                  Text(
                    '- or login with -',
                    style:
                        AppTextStyles.font22BlackBold.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 50.h),
                  AppTextButton(
                    iconWithText: FontAwesomeIcons.google,
                    buttonText: 'Login with google',
                    textStyle: AppTextStyles.font20BlacRegular
                        .copyWith(fontSize: 16.sp),
                    backgroundColor: Colors.white,
                    verticalPadding: 10,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppTextStyles.font14DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}
