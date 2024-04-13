class UserProfileModel {
  String? firstName;
  String? lastName;
  bool? maleGender;
  String? email;
  String? password;
  String? userName;
  String? phoneNumber;
  int? cityId;
  String? street;
  String? dateOfBirth;

  UserProfileModel({
    this.firstName,
    this.lastName,
    this.maleGender,
    this.email,
    this.password,
    this.userName,
    this.phoneNumber,
    this.cityId,
    this.street,
    this.dateOfBirth,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      maleGender: json['maleGender'] as bool?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      cityId: json['cityId'] as int?,
      street: json['street'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'maleGender': maleGender,
        'email': email,
        'password': password,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'cityId': cityId,
        'street': street,
        'dateOfBirth': dateOfBirth,
      };
}
