import 'package:json_annotation/json_annotation.dart';

part 'categorie_model.g.dart';

@JsonSerializable()
class Categorie {
  final int id;
  final String createdAt;
  final String title;
  final String bannerImage;
  final String smallImage;

  Categorie({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.bannerImage,
    required this.smallImage,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'],
      createdAt: json['created_at'],
      title: json['title'],
      bannerImage: json['banner_image'],
      smallImage: json['small_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'title': title,
      'banner_image': bannerImage,
      'small_image': smallImage,
    };
  }
}
