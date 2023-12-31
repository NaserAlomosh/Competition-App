// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/feacher/question/model/questions_model.dart';
import 'package:final_project/feacher/question/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  List<QuestionsModel> questions = [];
  var selectedValue = 1;
  getQuestions() async {
    emit(QuestionsLoading());
    try {
      var value =
          await FirebaseFirestore.instance.collection('questions').get();
      questions = value.docs
          .map((element) => QuestionsModel.fromJson(element.data()))
          .toList();
      emit(QuestionsSuccess());
    } catch (e) {
      print('#### $e');
    }
  }
}
