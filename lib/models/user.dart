import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String password;
  final String email;
  final String type;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.type,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }
  String toJson()=>json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      // address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      // cart: cart ?? this.cart,
    );
  }
}
