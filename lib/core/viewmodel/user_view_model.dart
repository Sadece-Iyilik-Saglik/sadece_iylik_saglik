import '../model/user_model.dart';

class UserViewModel {
  static List<User> get users => [User(name: "Mustafa",surname: "Kılıç",email: "a@gmail.com", password: "123456")];

  User createUser(User user){
    users.add(user);
    return user;
  }
}
