import 'dart:convert';

class User {
  int id;
  String username;
  String password;

  User({
    this.id =0,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        username: map["username"],
        password: map["password"],
    );
  }

  @override
  String toString() {
    return 'Voucher{id: $id, username: $username, password: $password}';
  }

}

List<User> FetchUser(String jsonData) {
  final Map<String, dynamic> data = json.decode(jsonData);
  final List<dynamic> userData = data['data'];
  return List<User>.from(userData.map((item) => User.fromJson(item)));
}
