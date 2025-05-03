import 'package:auth_app/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    confirmPassword: '',
    token: '',
  );

  //to get the user
  User get user => _user;

  //to set the user
  //It decodes the JSON string into a User object using User.fromJson(user).
  //You fetch the user from a backend server as JSON (then you use setUser()).
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  //It directly assigns the given User object to _user.
  //You create or edit a User inside the app already as a Dart object (then you use setUserFromModel()).
  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
