class PotModel {
  List<PotProducts>? potProducts;

  PotModel({this.potProducts});

  PotModel.fromJson(Map<String, dynamic> json) {
    if (json['potProducts'] != null) {
      potProducts = <PotProducts>[];
      json['potProducts'].forEach((v) {
        potProducts!.add(new PotProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.potProducts != null) {
      data['potProducts'] = this.potProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PotProducts {
  String? colors;
  int? id;
  String? imageUrl;
  String? material;
  String? name;
  String? releventImgUrl;
  List<PotVariations>? potVariations;

  PotProducts(
      {this.colors,
      this.id,
      this.imageUrl,
      this.material,
      this.name,
      this.releventImgUrl,
      this.potVariations});

  PotProducts.fromJson(Map<String, dynamic> json) {
    colors = json['colors'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    material = json['material'];
    name = json['name'];
    releventImgUrl = json['ReleventImgUrl'];
    if (json['potVariations'] != null) {
      potVariations = <PotVariations>[];
      json['potVariations'].forEach((v) {
        potVariations!.add(new PotVariations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colors'] = this.colors;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['material'] = this.material;
    data['name'] = this.name;
    data['ReleventImgUrl'] = this.releventImgUrl;
    if (this.potVariations != null) {
      data['potVariations'] =
          this.potVariations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PotVariations {
  String? imageUrl;
  double? price;
  String? releventImgUrl;
  String? sizes;
  int? variationId;

  PotVariations(
      {this.imageUrl,
      this.price,
      this.releventImgUrl,
      this.sizes,
      this.variationId});

  PotVariations.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    price = (json['price'] ?? 0).toDouble();
    releventImgUrl = json['ReleventImgUrl'];
    sizes = json['sizes'];
    variationId = json['variationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['ReleventImgUrl'] = this.releventImgUrl;
    data['sizes'] = this.sizes;
    data['variationId'] = this.variationId;
    return data;
  }
}
