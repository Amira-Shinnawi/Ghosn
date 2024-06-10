class PublicPost {
  List<RecommendedPosts>? recommendedPosts;

  PublicPost({this.recommendedPosts});

  PublicPost.fromJson(Map<String, dynamic> json) {
    if (json['recommendedPosts'] != null) {
      recommendedPosts = <RecommendedPosts>[];
      json['recommendedPosts'].forEach((v) {
        recommendedPosts!.add(new RecommendedPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recommendedPosts != null) {
      data['recommendedPosts'] =
          this.recommendedPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedPosts {
  String? createdAt;
  int? id;
  String? imageUrl;
  String? postAudience;
  String? releventImgUrl;
  String? text;
  int? totalComments;
  int? totalLikes;
  List<CommentsPublicPost>? comments;
  AuthorPublicPost? author;

  RecommendedPosts(
      {this.createdAt,
      this.id,
      this.imageUrl,
      this.postAudience,
      this.releventImgUrl,
      this.text,
      this.totalComments,
      this.totalLikes,
      this.comments,
      this.author});

  RecommendedPosts.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    postAudience = json['postAudience'];
    releventImgUrl = json['ReleventImgUrl'];
    text = json['text'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    if (json['comments'] != null) {
      comments = <CommentsPublicPost>[];
      json['comments'].forEach((v) {
        comments!.add(new CommentsPublicPost.fromJson(v));
      });
    }
    author =
        json['Author'] != null ? new AuthorPublicPost.fromJson(json['Author']) : null;
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
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['Author'] = this.author!.toJson();
    }
    return data;
  }
}

class CommentsPublicPost {
  String? content;
  String? createdAt;
  int? id;
  int? postId;
  int? totalLikes;
  int? userId;
  AuthorPublicPost? author;

  CommentsPublicPost(
      {this.content,
      this.createdAt,
      this.id,
      this.postId,
      this.totalLikes,
      this.userId,
      this.author});

  CommentsPublicPost.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    postId = json['postId'];
    totalLikes = json['totalLikes'];
    userId = json['userId'];
    author =
        json['Author'] != null ? new AuthorPublicPost.fromJson(json['Author']) : null;
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

class AuthorPublicPost {
  String? firstName;
  int? id;
  String? image;
  String? lastName;
  String? releventImgUrl;
  int? totalFolloweesCount;
  int? totalFollowersCount;
  String? userName;

  AuthorPublicPost(
      {this.firstName,
      this.id,
      this.image,
      this.lastName,
      this.releventImgUrl,
      this.totalFolloweesCount,
      this.totalFollowersCount,
      this.userName});

  AuthorPublicPost.fromJson(Map<String, dynamic> json) {
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
