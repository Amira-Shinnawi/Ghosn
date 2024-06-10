class FollowerUser {
  List<Followers>? followers;

  FollowerUser({this.followers});

  FollowerUser.fromJson(Map<String, dynamic> json) {
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followers {
  bool? isFollowingBack;
  Follower? follower;

  Followers({this.isFollowingBack, this.follower});

  Followers.fromJson(Map<String, dynamic> json) {
    isFollowingBack = json['isFollowingBack'];
    follower = json['follower'] != null
        ? new Follower.fromJson(json['follower'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFollowingBack'] = this.isFollowingBack;
    if (this.follower != null) {
      data['follower'] = this.follower!.toJson();
    }
    return data;
  }
}

class Follower {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;
  List<PostsFollower>? posts;
  List<CommentsFollower>? comments;

  Follower(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName,
      this.posts,
      this.comments});

  Follower.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    id = json['id'];
    image = json['image'];
    lastName = json['lastName'];
    releventImgUrl = json['ReleventImgUrl'];
    totalFolloweesCount = json['totalFolloweesCount'];
    totalFollowersCount = json['totalFollowersCount'];
    userName = json['userName'];
    if (json['posts'] != null) {
      posts = <PostsFollower>[];
      json['posts'].forEach((v) {
        posts!.add(new PostsFollower.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <CommentsFollower>[];
      json['comments'].forEach((v) {
        comments!.add(new CommentsFollower.fromJson(v));
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
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostsFollower {
  String? createdAt;
  int? id;
  String? imageUrl;
  String? postAudience;
  String? releventImgUrl;
  String? text;
  int? totalComments;
  int? totalLikes;
  AuthorFollower? author;
  List<CommentsFollower>? comments;

  PostsFollower(
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

  PostsFollower.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    postAudience = json['postAudience'];
    releventImgUrl = json['ReleventImgUrl'];
    text = json['text'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    author =
        json['Author'] != null ? new AuthorFollower.fromJson(json['Author']) : null;
    if (json['comments'] != null) {
      comments = <CommentsFollower>[];
      json['comments'].forEach((v) {
        comments!.add(new CommentsFollower.fromJson(v));
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

class AuthorFollower {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;

  AuthorFollower(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName});

  AuthorFollower.fromJson(Map<String, dynamic> json) {
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

class CommentsFollower {
  String? content;
  String? createdAt;
  int? id;
  int? postId;
  int? totalLikes;
  int? userId;
  AuthorFollower? author;

  CommentsFollower(
      {this.content,
      this.createdAt,
      this.id,
      this.postId,
      this.totalLikes,
      this.userId,
      this.author});

  CommentsFollower.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    postId = json['postId'];
    totalLikes = json['totalLikes'];
    userId = json['userId'];
    author =
        json['Author'] != null ? new AuthorFollower.fromJson(json['Author']) : null;
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
