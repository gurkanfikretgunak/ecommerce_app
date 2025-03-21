// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: (json['id'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
      text: json['text'] as String?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] as String?,
      productDetailId: (json['productDetailId'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'text': instance.text,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'productDetailId': instance.productDetailId,
      'user': instance.user,
    };
