class UserPostModel {
  List<MyPosts>? myPosts;

  UserPostModel({this.myPosts});

  UserPostModel.fromJson(Map<String, dynamic> json) {
    if (json['myPosts'] != null) {
      myPosts = <MyPosts>[];
      json['myPosts'].forEach((v) {
        myPosts!.add(new MyPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myPosts != null) {
      data['myPosts'] = this.myPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyPosts {
  bool? isLikedByMe;
  Post? post;

  MyPosts({this.isLikedByMe, this.post});

  MyPosts.fromJson(Map<String, dynamic> json) {
    isLikedByMe = json['IsLikedByMe'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsLikedByMe'] = this.isLikedByMe;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  String? createdAt;
  int? id;
  String? imageUrl;
  String? postAudience;
  String? releventImgUrl;
  String? text;
  int? totalComments;
  int? totalLikes;
  Author? author;
  List<Comments>? comments;

  Post(
      {this.createdAt,
      this.id,
      this.imageUrl,
      this.postAudience,
      this.releventImgUrl,
      this.text,
      this.totalComments,
      this.totalLikes,
      this.author,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    postAudience = json['postAudience'];
    releventImgUrl = json['ReleventImgUrl'];
    text = json['text'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    author =
        json['Author'] != null ? new Author.fromJson(json['Author']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['postAudience'] = this.postAudience;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['text'] = this.text;
    data['totalComments'] = this.totalComments;
    data['totalLikes'] = this.totalLikes;
    if (this.author != null) {
      data['Author'] = this.author!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;

  Author(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName});

  Author.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    id = json['id'];
    image = json['image'];
    lastName = json['lastName'];
    releventImgUrl = json['ReleventImgUrl'];
    totalFolloweesCount = json['totalFolloweesCount'];
    totalFollowersCount = json['totalFollowersCount'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['image'] = this.image;
    data['lastName'] = this.lastName;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['totalFolloweesCount'] = this.totalFolloweesCount;
    data['totalFollowersCount'] = this.totalFollowersCount;
    data['userName'] = this.userName;
    return data;
  }
}

class Comments {
  String? content;
  String? createdAt;
  int? id;
  int? postId;
  int? totalLikes;
  int? userId;
  Author? author;

  Comments(
      {this.content,
      this.createdAt,
      this.id,
      this.postId,
      this.totalLikes,
      this.userId,
      this.author});

  Comments.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    postId = json['postId'];
    totalLikes = json['totalLikes'];
    userId = json['userId'];
    author =
        json['Author'] != null ? new Author.fromJson(json['Author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['totalLikes'] = this.totalLikes;
    data['userId'] = this.userId;
    if (this.author != null) {
      data['Author'] = this.author!.toJson();
    }
    return data;
  }
}
