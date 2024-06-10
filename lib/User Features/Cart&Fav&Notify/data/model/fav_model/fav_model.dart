import 'package:equatable/equatable.dart';

class FavModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? categoryName;

  const FavModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.categoryName,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
        categoryName: json['categoryName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'categoryName': categoryName,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      categoryName,
    ];
  }
}
