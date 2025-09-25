import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? date;
  bool? isOnline;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.date,
    this.isOnline,
  });

  /// Convert Firestore/Realtime Database JSON -> Dart object
  factory UserModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      date: json['date'] as String?,
      isOnline: json.toString().contains('is_online') ?  json['is_online'] : false,
    );
  }

  /// Convert Dart object -> JSON (for Firebase)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'date': date,
      'is_online':isOnline,
    };
  }
}
