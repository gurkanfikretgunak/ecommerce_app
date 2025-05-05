import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class Review {
  int? id;
  int? rate;
  String? text;
  String? userId;
  String? createdAt;
  int? productDetailId;
  User? user;

  Review(
      {this.id,
      this.rate,
      this.text,
      this.userId,
      this.createdAt,
      this.productDetailId,
      this.user});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    text = json['text'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    productDetailId = json['product_detail_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'text': text,
      'rate': rate,
      'product_detail_id': productDetailId,
    };
  }
}
