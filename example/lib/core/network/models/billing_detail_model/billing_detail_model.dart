import 'package:json_annotation/json_annotation.dart';

part 'billing_detail_model.g.dart';

@JsonSerializable()
class BillingDetail {
  int? id;
  String? createdAt;
  String? userId;
  String? firstName;
  String? lastName;
  String? country;
  String? address;
  String? city;
  String? phoneNumber;
  String? emailAddress;
  bool? isDefault;

  BillingDetail(
      {this.id,
      this.createdAt,
      this.userId,
      this.firstName,
      this.lastName,
      this.country,
      this.address,
      this.city,
      this.phoneNumber,
      this.emailAddress,
      this.isDefault});

  BillingDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    country = json['country'];
    address = json['address'];
    city = json['city'];
    phoneNumber = json['phone_number'];
    emailAddress = json['email_address'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country'] = this.country;
    data['address'] = this.address;
    data['city'] = this.city;
    data['phone_number'] = this.phoneNumber;
    data['email_address'] = this.emailAddress;
    data['is_default'] = this.isDefault;
    return data;
  }
}
