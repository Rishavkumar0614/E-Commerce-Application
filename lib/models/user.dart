import 'dart:convert';

class User {
  final String id;
  final String name;
  final String type;
  final String email;
  final String token;
  final String address;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.type,
    required this.email,
    required this.token,
    required this.address,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'email': email,
      'token': token,
      'address': address,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      address: map['address'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) => User.fromMap(json.decode)
}