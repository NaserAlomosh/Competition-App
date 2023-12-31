import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConstants {
  static final users = FirebaseFirestore.instance.collection('users');

  static final librarys = FirebaseFirestore.instance.collection('librarys');
}
