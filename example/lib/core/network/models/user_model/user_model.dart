import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final String phone_number;
  final String created_at;
  final String? profile_picture;
  final String display_name;
  final String first_name;
  final String last_name;

  User(
      {required this.id,
      required this.email,
      required this.phone_number,
      required this.created_at,
      this.profile_picture,
      required this.display_name,
      required this.first_name,
      required this.last_name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        phone_number: json['phone_number'],
        created_at: json['created_at'],
        profile_picture: json['profile_picture'],
        display_name: json['display_name'],
        first_name: json['first_name'],
        last_name: json['last_name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'email': email,
      'phone_number': phone_number,
      'created_at': created_at,
      'display_name': display_name,
      'first_name': first_name,
      'last_name': last_name,
    };

    if (profile_picture != null) {
      data['profile_picture'] = profile_picture;
    }

    return data;
  }
}
