class PaymentData {
  String street;
  String phoneNumber;
  String paymentMethod;

  String country;
  String state;
  String city;
   String get address => ' $city, $state ,$street';

  PaymentData({
    required this.street,
    required this.phoneNumber,
    required this.paymentMethod,
   
    required this.country,
    required this.state,
    required this.city,
  });
}