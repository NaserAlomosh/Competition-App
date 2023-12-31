// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../firebase/save_user_data_to_firestore.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  String selectedGender = 'male';
  String selectedYear = '1';
  String selectedCollege = 'information technology';
  String selectedDepartment = 'Software engineering';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //
  SignUpCubit() : super(SignUpInitial());
  void signUpCubit() async {
    if (formKey.currentState!.validate()) {
      emit(SignUpLoadingState());
      try {
        var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text.trim(),
        );
        await addUserToFirestore(
          email: data.user!.email!,
          id: data.user!.uid,
          username: userNameHandlers(),
          gender: selectedGender,
          college: selectedCollege,
          department: selectedDepartment,
          year: int.parse(selectedYear),
          phone: int.parse(phoneController.text),
        );
        print('User Sign Up successfully!');
        emit(SignUpSuccessState());
      } on FirebaseAuthException catch (error) {
        emit(SignUpErrorState(error.message ?? 'Cheak your internet'));
      }
    }
  }

  userNameHandlers() {
    return '${capitalizeFirstLetter(firstNameController.text)} ${capitalizeFirstLetter(lastNameController.text)}';
  }

  String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
