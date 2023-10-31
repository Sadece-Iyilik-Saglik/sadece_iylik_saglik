import 'package:sadece_iylik_saglik/core/viewmodel/user_view_model.dart';

import '../../model/user_model.dart';

class Auth {
  User get currentUser => UserViewModel.users.first;

  bool signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    if(currentUser.email==email&&currentUser.password==password){
      return true;
    }
    return false;
  }

  Future<void> createUserWithEmailAndPassword({
    required User user,
  }) async {
    UserViewModel().createUser(user);
  }
}
