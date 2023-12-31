import '../../../core/firebase_constants/firebase_constants.dart';
import '../model/user_model.dart';

UserModel? userModel;
getUserData({required String id}) async {
  var data = await FirebaseConstants.users.doc(id).get();
  userModel = UserModel.fromJson(data.data());
}
