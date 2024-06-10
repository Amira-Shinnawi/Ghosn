class PurchasesModel {
  int? orderId;
  int? productId;
  int? quantity;
  String? productType;
  Details? details;

  PurchasesModel(
      {this.orderId,
      this.productId,
      this.quantity,
      this.productType,
      this.details});

  PurchasesModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    productType = json['productType'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['productType'] = this.productType;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? name;
  String? imageUrl;
  String? potVariations;

  Details({this.name, this.imageUrl, this.potVariations});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    potVariations = json['potVariations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['potVariations'] = this.potVariations;
    return data;
  }
}
