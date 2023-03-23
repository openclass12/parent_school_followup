import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? createdAt;
  final String? updateAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.updateAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }
}
