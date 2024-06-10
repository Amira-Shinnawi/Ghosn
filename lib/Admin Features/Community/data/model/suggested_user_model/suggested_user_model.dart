class SuggestedUserModel {
  int? id;
  String? userName;
  String? fullName;
  String? imageProfile;
  bool? isFollowing;

  SuggestedUserModel(
      {this.id,
      this.userName,
      this.fullName,
      this.imageProfile,
      this.isFollowing});

  SuggestedUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    imageProfile = json['imageProfile'];
    isFollowing = json['isFollowing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['imageProfile'] = this.imageProfile;
    data['isFollowing'] = this.isFollowing;
    return data;
  }
}
