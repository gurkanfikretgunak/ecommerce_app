// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      created_at: json['created_at'] as String,
      profile_picture: json['profile_picture'] as String,
      display_name: json['display_name'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'created_at': instance.created_at,
      'profile_picture': instance.profile_picture,
      'display_name': instance.display_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
