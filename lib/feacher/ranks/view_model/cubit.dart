import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/feacher/ranks/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/ranks_model.dart';

class RanksCubit extends Cubit<RanksState> {
  RanksCubit() : super(RanksInitial());
  List<RanksModel> topThreeUser = [];
  List<RanksModel> rankedUser = [];
  Future<void> getTopThree() async {
    emit(RanksLoading());
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    // Reference to the collection
    QuerySnapshot querySnapshot =
        await usersCollection.orderBy('point', descending: true).limit(3).get();

    // Clear the list before adding new users
    topThreeUser.clear();

    for (var element in querySnapshot.docs) {
      // Explicitly cast the data to Map<String, dynamic>
      Map<String, dynamic> userData = element.data() as Map<String, dynamic>;

      // Use the fromJson method to convert the data to UserModel
      topThreeUser.add(RanksModel.fromJson(userData));
    }
  }

  Future<void> getRankedUser() async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Clear the list before adding new users

    // Get the top three users
    var topThreeQuerySnapshot =
        await usersCollection.orderBy('point', descending: true).limit(3).get();

    // Extract the last document in the top three (if any)
    var lastDocument = topThreeQuerySnapshot.docs.isNotEmpty
        ? topThreeQuerySnapshot.docs.last
        : null;

    // Use startAfter with the field values of the last document in the top three
    var rankedUsersQuerySnapshot = await usersCollection
        .orderBy('point', descending: true)
        .startAfter([lastDocument?['point']]).get();

    for (var element in rankedUsersQuerySnapshot.docs) {
      // Explicitly cast the data to Map<String, dynamic>
      Map<String, dynamic> userData = element.data() as Map<String, dynamic>;

      // Use the fromJson method to convert the data to UserModel
      rankedUser.add(RanksModel.fromJson(userData));
    }

    emit(RanksSucsses());
  }
// Query to get all users excluding the top three
}
