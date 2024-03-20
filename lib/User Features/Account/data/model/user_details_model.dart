class UserDetailsModel {
  String? displayName;
  String? email;
  String? photoURL;
  String? token;

  UserDetailsModel({
    this.displayName,
    this.email,
    this.photoURL,
    this.token,
  });
  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
    token = json['accessToken'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = new Map<String, dynamic>();

    mapData['displayName'] = this.displayName;
    mapData['email'] = this.email;
    mapData['photoURL'] = this.photoURL;
    mapData['accessToken'] = this.token;

    return mapData;
  }
}