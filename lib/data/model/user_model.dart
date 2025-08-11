

import 'package:clean_archi/domain/entities/user_entity.dart';

class UserModel {
  String? name;
  String? email;
  String? id;
  PaymentMethodModel? paymentMethod;
  String? image;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.paymentMethod,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    paymentMethod =
        paymentMethod =
            json["paymentMethod"] != null
                ? PaymentMethodModel.fromJson(
                  json["paymentMethod"],
                )
                : null;
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email ?? "";
    data['_id'] = id ?? "";
    data['name'] = name ?? "";
    data['paymentMethod'] = paymentMethod ?? {};
    data['image'] = image ?? "";

    return data;
  }

  UserEntity toEntity() {
    return UserEntity(
      email: email ?? '',
      id: id ?? '',
      image: image ?? '',
      name: name ?? '',
      paymentMethod:
          paymentMethod?.toEntity() ??
          PaymentMethodEntity(
            holderName: "",
            number: "",
            cvv: "",
            expiryDate: "",
          ),
    );
  }
}

class PaymentMethodModel {
  String holderName;
  String number;
  String cvv;
  String expiryDate;

  PaymentMethodModel({
    required this.holderName,
    required this.number,
    required this.cvv,
    required this.expiryDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'holderName': holderName,
      'number': number,
      'cvv': cvv,
      'expiryDate': expiryDate,
    };
  }

  // Create object from JSON
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      holderName: json['holderName'],
      number: json['number'],
      cvv: json['cvv'],
      expiryDate: json['expiryDate'],
    );
  }

  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      holderName: holderName,
      number: number,
      cvv: cvv,
      expiryDate: expiryDate,
    );
  }
}
