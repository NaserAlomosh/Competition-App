// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';

import '../../sign_in/model/user_model.dart';

Future<void> addUserToFirestore({
  required String college,
  required String department,
  required String email,
  required String id,
  required String username,
  required String gender,
  required int year,
  int? phone,
}) async {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  try {
    userModel = UserModel(
      college: college,
      department: department,
      email: email,
      gender: gender,
      id: id,
      phone: phone,
      point: 0,
      username: username,
      year: year,
    );
    await usersCollection.doc(userModel!.id).set(userModel!.toMap());
    print('User added to Firestore successfully!');
  } catch (e) {
    print('Error adding user to Firestore: $e');
  }
}
