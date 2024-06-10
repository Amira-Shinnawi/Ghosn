import 'package:equatable/equatable.dart';

class BestSellerModel extends Equatable {
  final String? name;
  final String? description;
  final String? imageUrl;

  const BestSellerModel({this.name, this.description, this.imageUrl});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [name, description, imageUrl];
}
