class FriendFollowingUser {
  List<Followings>? followings;

  FriendFollowingUser({this.followings});

  FriendFollowingUser.fromJson(Map<String, dynamic> json) {
    if (json['followings'] != null) {
      followings = <Followings>[];
      json['followings'].forEach((v) {
        followings!.add(new Followings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followings != null) {
      data['followings'] = this.followings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followings {
  bool? isFollowingBack;
  Followee? followee;

  Followings({this.isFollowingBack, this.followee});

  Followings.fromJson(Map<String, dynamic> json) {
    isFollowingBack = json['isFollowingBack'];
    followee = json['followee'] != null
        ? new Followee.fromJson(json['followee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFollowingBack'] = this.isFollowingBack;
    if (this.followee != null) {
      data['followee'] = this.followee!.toJson();
    }
    return data;
  }
}

class Followee {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;
  List<PostsFollowing>? posts;

  Followee(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName,
      this.posts});

  Followee.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    id = json['id'];
    image = json['image'];
    lastName = json['lastName'];
    releventImgUrl = json['ReleventImgUrl'];
    totalFolloweesCount = json['totalFolloweesCount'];
    totalFollowersCount = json['totalFollowersCount'];
    userName = json['userName'];
    if (json['posts'] != null) {
      posts = <PostsFollowing>[];
      json['posts'].forEach((v) {
        posts!.add(new PostsFollowing.fromJson(v));
      });
    }
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
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostsFollowing {
  String? createdAt;
  int? id;
  String? imageUrl;
  String? postAudience;
  String? releventImgUrl;
  String? text;
  int? totalComments;
  int? totalLikes;
  AuthorFollowing? author;
  List<CommentsFollowing>? comments;

  PostsFollowing(
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

  PostsFollowing.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    postAudience = json['postAudience'];
    releventImgUrl = json['ReleventImgUrl'];
    text = json['text'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    author =
        json['Author'] != null ? new AuthorFollowing.fromJson(json['Author']) : null;
    if (json['comments'] != null) {
      comments = <CommentsFollowing>[];
      json['comments'].forEach((v) {
        comments!.add(new CommentsFollowing.fromJson(v));
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

class AuthorFollowing {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;

  AuthorFollowing(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName});

  AuthorFollowing.fromJson(Map<String, dynamic> json) {
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

class CommentsFollowing {
  String? content;
  String? createdAt;
  int? id;
  int? postId;
  int? totalLikes;
  int? userId;
  AuthorFollowing? author;

  CommentsFollowing(
      {this.content,
      this.createdAt,
      this.id,
      this.postId,
      this.totalLikes,
      this.userId,
      this.author});

  CommentsFollowing.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    postId = json['postId'];
    totalLikes = json['totalLikes'];
    userId = json['userId'];
    author =
        json['Author'] != null ? new AuthorFollowing.fromJson(json['Author']) : null;
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
