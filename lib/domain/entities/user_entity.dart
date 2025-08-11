
class UserEntity {
  String name;
  String email;
  String? id;
  PaymentMethodEntity paymentMethod;
  String image;
  String? password;
  UserEntity({
    required this.name,
    required this.email,
    this.id,
    required this.paymentMethod,
    required this.image,
    this.password
  });
}

class PaymentMethodEntity {
  String holderName;
  String number;
  String cvv;
  String expiryDate;
  PaymentMethodEntity({
    required this.holderName,
    required this.number,
    required this.cvv,
    required this.expiryDate,
  });
}
