import 'package:equatable/equatable.dart';

class UserProfileEditModel {
  String? firstName;
  String? lastName;
  bool? isMale;
  String? userName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? imgUrl;
  String? cityName;
  String? countryName;
  String? stateName;
  String? street;
  int? totalFollwers;
  int? totalFollowees;

  UserProfileEditModel(
      {this.firstName,
      this.lastName,
      this.isMale,
      this.userName,
      this.email,
      this.phoneNumber,
      this.dateOfBirth,
      this.imgUrl,
      this.cityName,
      this.countryName,
      this.stateName,
      this.street,
      this.totalFollwers,
      this.totalFollowees});

  UserProfileEditModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    isMale = json['isMale'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    imgUrl = json['imgUrl'];
    cityName = json['cityName'];
    countryName = json['countryName'];
    stateName = json['stateName'];
    street = json['street'];
    totalFollwers = json['totalFollwers'];
    totalFollowees = json['totalFollowees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['isMale'] = this.isMale;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['imgUrl'] = this.imgUrl;
    data['cityName'] = this.cityName;
    data['countryName'] = this.countryName;
    data['stateName'] = this.stateName;
    data['street'] = this.street;
    data['totalFollwers'] = this.totalFollwers;
    data['totalFollowees'] = this.totalFollowees;
    return data;
  }
}
