import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.token,
  });

  //(Object ➔ JSON String)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'token': token,
    };
  }

  //JSON String ➔ Object)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['confirmPassword'] ?? '',
      token: map['token'] ?? '',
    );
  }

  //  //(Object ➔ JSON String)
  String toJson() => json.encode(toMap());

  // //JSON String ➔ Object)
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
