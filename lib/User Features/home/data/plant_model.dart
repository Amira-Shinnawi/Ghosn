class PlantModel {
  List<Plants>? plants;
  List<Categories>? categories;

  PlantModel({this.plants, this.categories});

  PlantModel.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plants>[];
      json['plants'].forEach((v) {
        plants!.add(new Plants.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plants != null) {
      data['plants'] = this.plants!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plants {
  int? id;
  String? name;
  String? description;
  String? soilType;
  double? defaultPrice;
  int? amountOfWater;
  int? amountSunlight;
  int? minTemperature;
  int? maxTemperature;
  String? humdity;
  double? height;
  String? imageUrl;
  String? releventImgUrl;
  Category? category;
  int? quantity;

  List<UserReviews>? userReviews;

  Plants(
      {this.id,
      this.name,
      this.description,
      this.soilType,
      this.defaultPrice,
      this.amountOfWater,
      this.amountSunlight,
      this.minTemperature,
      this.maxTemperature,
      this.humdity,
      this.height,
      this.imageUrl,
      this.quantity,
      this.releventImgUrl,
      this.category,
      this.userReviews});

  Plants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    soilType = json['soilType'];
    defaultPrice = (json['defaultPrice'] ?? 0).toDouble();
    amountOfWater = json['amountOfWater'];
    amountSunlight = json['amountSunlight'];
    minTemperature = json['minTemperature'];
    maxTemperature = json['maxTemperature'];
    quantity = json['quantity'];

    humdity = json['humdity'];
    height = (json['height'] ?? 0).toDouble();
    imageUrl = json['imageUrl'];
    releventImgUrl = json['ReleventImgUrl'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['userReviews'] != null) {
      userReviews = <UserReviews>[];
      json['userReviews'].forEach((v) {
        userReviews!.add(new UserReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['soilType'] = this.soilType;
    data['defaultPrice'] = this.defaultPrice;
    data['amountOfWater'] = this.amountOfWater;
    data['amountSunlight'] = this.amountSunlight;
    data['minTemperature'] = this.minTemperature;
    data['maxTemperature'] = this.maxTemperature;
    data['humdity'] = this.humdity;
    data['height'] = this.height;
    data['imageUrl'] = this.imageUrl;
    data['quantity'] = this.quantity;

    data['ReleventImgUrl'] = this.releventImgUrl;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.userReviews != null) {
      data['userReviews'] = this.userReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? description;
  int? id;
  String? name;
  List<Products>? products;

  Category({this.description, this.id, this.name, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? description;
  int? id;
  String? imageUrl;
  String? name;

  Products({this.description, this.id, this.imageUrl, this.name});

  Products.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    return data;
  }
}

class UserReviews {
  String? comment;
  String? dateAdded;
  int? rating;

  UserReviews({this.comment, this.dateAdded, this.rating});

  UserReviews.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    dateAdded = json['dateAdded'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['dateAdded'] = this.dateAdded;
    data['rating'] = this.rating;
    return data;
  }
}

class Categories {
  String? description;
  String? name;
  int? id;

  Categories({this.description, this.name, this.id});

  Categories.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
