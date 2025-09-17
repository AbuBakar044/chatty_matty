class UserModel {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? date;

  UserModel({this.userId, this.name, this.email, this.password, this.date});

  /// Convert Firestore/Realtime Database JSON -> Dart object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      date: json['date'] as String?,
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
    };
  }
}
