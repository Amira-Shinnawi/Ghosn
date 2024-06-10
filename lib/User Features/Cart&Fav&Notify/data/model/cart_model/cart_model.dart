class CartModel {
  List<CartItems>? cartItems;
  double? totalPriceOfAllProducts;

  CartModel({this.cartItems, this.totalPriceOfAllProducts});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    totalPriceOfAllProducts = (json['totalPriceOfAllProducts'] ?? 0).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartItems != null) {
      data['cartItems'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['totalPriceOfAllProducts'] = this.totalPriceOfAllProducts;
    return data;
  }
}

class CartItems {
  int? id;
  int? potParentId;
  bool? isPotVariation;
  String? name;
  String? description;
  String? imageurl;
  int? quantity;
  double? defaultPrice;
  double? totalPrice;
  String? dateAdded;
  String? size;

  CartItems(
      {this.id,
      this.potParentId,
      this.isPotVariation,
      this.name,
      this.description,
      this.imageurl,
      this.quantity,
      this.defaultPrice,
      this.totalPrice,
      this.dateAdded,
      this.size});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    potParentId = json['potParentId'];
    isPotVariation = json['isPotVariation'];
    name = json['name'];
    description = json['description'];
    imageurl = json['imageurl'];
    quantity = json['quantity'];
    defaultPrice = (json['defaultPrice'] ?? 0).toDouble();
    totalPrice = (json['totalPrice'] ?? 0).toDouble();
    dateAdded = json['dateAdded'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['potParentId'] = this.potParentId;
    data['isPotVariation'] = this.isPotVariation;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageurl'] = this.imageurl;
    data['quantity'] = this.quantity;
    data['defaultPrice'] = this.defaultPrice;
    data['totalPrice'] = this.totalPrice;
    data['dateAdded'] = this.dateAdded;
    data['size'] = this.size;
    return data;
  }
}
