import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../firebase/get_user_data.dart';
import 'states.dart';

class SignInCubit extends Cubit<SignInState> {
  bool isVisibilitytext = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //
  SignInCubit() : super(SignInInitial());
  void signInCubit({String? username, String? password}) async {
    if (formKey.currentState!.validate()) {
      emit(SignInLoadingState());
      try {
        var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text,
        );
        await getUserData(id: user.user!.uid);
        emit(SignInSuccessState());
      } on FirebaseAuthException catch (e) {
        emit(SignInErrorState(e.message!.toUpperCase()));
      }
    }
  }

  visibility() {
    // Change visibility text
    isVisibilitytext = !isVisibilitytext;
    emit(SignInVisibilityState());
    //
  }
}
