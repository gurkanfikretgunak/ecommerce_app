// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
      id: (json['id'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      title: json['title'] as String,
      bannerImage: json['bannerImage'] as String,
      smallImage: json['smallImage'] as String,
    );

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'title': instance.title,
      'bannerImage': instance.bannerImage,
      'smallImage': instance.smallImage,
    };
