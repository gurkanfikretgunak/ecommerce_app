// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingDetail _$BillingDetailFromJson(Map<String, dynamic> json) =>
    BillingDetail(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$BillingDetailToJson(BillingDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'address': instance.address,
      'city': instance.city,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'isDefault': instance.isDefault,
    };
