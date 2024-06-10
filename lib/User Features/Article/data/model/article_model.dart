class ArticleModel {
  List<AllArticles>? allArticles;

  ArticleModel({this.allArticles});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['allArticles'] != null) {
      allArticles = <AllArticles>[];
      json['allArticles'].forEach((v) {
        allArticles!.add(new AllArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allArticles != null) {
      data['allArticles'] = this.allArticles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllArticles {
  int? id;
  String? introImgUrl;
  String? publishDate;
  bool? published;
  String? releventImgUrl;
  String? slug;
  String? title;
  List<Sections>? sections;
  List<Tags>? tags;
  Author? author;

  AllArticles(
      {this.id,
      this.introImgUrl,
      this.publishDate,
      this.published,
      this.releventImgUrl,
      this.slug,
      this.title,
      this.sections,
      this.tags,
      this.author});

  AllArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    introImgUrl = json['introImgUrl'];
    publishDate = json['publishDate'];
    published = json['published'];
    releventImgUrl = json['ReleventImgUrl'];
    slug = json['slug'];
    title = json['title'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['introImgUrl'] = this.introImgUrl;
    data['publishDate'] = this.publishDate;
    data['published'] = this.published;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['slug'] = this.slug;
    data['title'] = this.title;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Sections {
  String? contentText;
  String? heading;
  String? imgUrl;
  String? releventImgUrl;
  int? sequence;

  Sections(
      {this.contentText,
      this.heading,
      this.imgUrl,
      this.releventImgUrl,
      this.sequence});

  Sections.fromJson(Map<String, dynamic> json) {
    contentText = json['contentText'];
    heading = json['heading'];
    imgUrl = json['imgUrl'];
    releventImgUrl = json['ReleventImgUrl'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentText'] = this.contentText;
    data['heading'] = this.heading;
    data['imgUrl'] = this.imgUrl;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['sequence'] = this.sequence;
    return data;
  }
}

class Tags {
  int? articleId;
  int? tagId;

  Tags({this.articleId, this.tagId});

  Tags.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    tagId = json['tagId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['articleId'] = this.articleId;
    data['tagId'] = this.tagId;
    return data;
  }
}

class Author {
  String? firstName;
  String? image;
  String? releventImgUrl;
  String? userName;
  int? id;
  String? lastName;

  Author(
      {this.firstName,
      this.image,
      this.releventImgUrl,
      this.userName,
      this.id,
      this.lastName});

  Author.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    image = json['image'];
    releventImgUrl = json['ReleventImgUrl'];
    userName = json['userName'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['image'] = this.image;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['userName'] = this.userName;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    return data;
  }
}
