class PlantIdentifyModel {
  IdentifyData? data;
  bool? successfulOperation;
  Null? errorMessage;
  Null? errorCode;

  PlantIdentifyModel(
      {this.data, this.successfulOperation, this.errorMessage, this.errorCode});

  PlantIdentifyModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new IdentifyData.fromJson(json['data']) : null;
    successfulOperation = json['successfulOperation'];
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['successfulOperation'] = this.successfulOperation;
    data['errorMessage'] = this.errorMessage;
    data['errorCode'] = this.errorCode;
    return data;
  }
}

class IdentifyData {
  int? confidenceScore;
  String? submittedImgUrl;
  String? plantName;
  String? plantNameArabic;
  String? plantOrigin;
  String? plantOriginArabic;
  String? blossomingSeason;
  String? blossomingSeasonArabic;
  String? description;
  String? descriptionArabic;
  int? minTemperature;
  int? maxTemperature;
  String? humidity;
  String? height;
  String? sunlightAmount;
  String? humidityArabic;
  String? heightArabic;
  String? sunlightAmountArabic;
  List<DescriptiveImages>? descriptiveImages;
  Null? categoryId;

  IdentifyData(
      {this.confidenceScore,
      this.submittedImgUrl,
      this.plantName,
      this.plantNameArabic,
      this.plantOrigin,
      this.plantOriginArabic,
      this.blossomingSeason,
      this.blossomingSeasonArabic,
      this.description,
      this.descriptionArabic,
      this.minTemperature,
      this.maxTemperature,
      this.humidity,
      this.height,
      this.sunlightAmount,
      this.humidityArabic,
      this.heightArabic,
      this.sunlightAmountArabic,
      this.descriptiveImages,
      this.categoryId});

  IdentifyData.fromJson(Map<String, dynamic> json) {
    confidenceScore = json['confidenceScore'];
    submittedImgUrl = json['submittedImgUrl'];
    plantName = json['plantName'];
    plantNameArabic = json['plantName_Arabic'];
    plantOrigin = json['plantOrigin'];
    plantOriginArabic = json['plantOrigin_Arabic'];
    blossomingSeason = json['blossomingSeason'];
    blossomingSeasonArabic = json['blossomingSeason_Arabic'];
    description = json['description'];
    descriptionArabic = json['description_Arabic'];
    minTemperature = json['minTemperature'];
    maxTemperature = json['maxTemperature'];
    humidity = json['humidity'];
    height = json['height'];
    sunlightAmount = json['sunlightAmount'];
    humidityArabic = json['humidity_Arabic'];
    heightArabic = json['height_Arabic'];
    sunlightAmountArabic = json['sunlightAmount_Arabic'];
    if (json['descriptiveImages'] != null) {
      descriptiveImages = <DescriptiveImages>[];
      json['descriptiveImages'].forEach((v) {
        descriptiveImages!.add(new DescriptiveImages.fromJson(v));
      });
    }
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidenceScore'] = this.confidenceScore;
    data['submittedImgUrl'] = this.submittedImgUrl;
    data['plantName'] = this.plantName;
    data['plantName_Arabic'] = this.plantNameArabic;
    data['plantOrigin'] = this.plantOrigin;
    data['plantOrigin_Arabic'] = this.plantOriginArabic;
    data['blossomingSeason'] = this.blossomingSeason;
    data['blossomingSeason_Arabic'] = this.blossomingSeasonArabic;
    data['description'] = this.description;
    data['description_Arabic'] = this.descriptionArabic;
    data['minTemperature'] = this.minTemperature;
    data['maxTemperature'] = this.maxTemperature;
    data['humidity'] = this.humidity;
    data['height'] = this.height;
    data['sunlightAmount'] = this.sunlightAmount;
    data['humidity_Arabic'] = this.humidityArabic;
    data['height_Arabic'] = this.heightArabic;
    data['sunlightAmount_Arabic'] = this.sunlightAmountArabic;
    if (this.descriptiveImages != null) {
      data['descriptiveImages'] =
          this.descriptiveImages!.map((v) => v.toJson()).toList();
    }
    data['categoryId'] = this.categoryId;
    return data;
  }
}

class DescriptiveImages {
  String? title;
  String? titleArabic;
  int? importanceLevel;
  String? imgUrl;

  DescriptiveImages(
      {this.title, this.titleArabic, this.importanceLevel, this.imgUrl});

  DescriptiveImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleArabic = json['title_Arabic'];
    importanceLevel = json['importanceLevel'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title_Arabic'] = this.titleArabic;
    data['importanceLevel'] = this.importanceLevel;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
