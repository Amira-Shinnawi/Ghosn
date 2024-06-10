// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnBoardingItemModel {
  final String image;
  final String title;
  final String subTitle;
  OnBoardingItemModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  OnBoardingItemModel copyWith({
    String? image,
    String? title,
    String? subTitle,
  }) {
    return OnBoardingItemModel(
      image: image ?? this.image,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'subTitle': subTitle,
    };
  }

  factory OnBoardingItemModel.fromMap(Map<String, dynamic> map) {
    return OnBoardingItemModel(
      image: map['image'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnBoardingItemModel.fromJson(String source) => OnBoardingItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OnBoardingItemModel(image: $image, title: $title, subTitle: $subTitle)';

  @override
  bool operator ==(covariant OnBoardingItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.title == title &&
      other.subTitle == subTitle;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ subTitle.hashCode;
}
