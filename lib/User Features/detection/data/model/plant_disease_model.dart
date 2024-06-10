class PlantDiseaseModel {
  PlantData? data;
  bool? successfulOperation;
  Null? errorMessage;
  Null? errorCode;

  PlantDiseaseModel(
      {this.data, this.successfulOperation, this.errorMessage, this.errorCode});

  PlantDiseaseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new PlantData.fromJson(json['data']) : null;
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

class PlantData {
  int? diseaseId;
  String? diseaseName;
  String? treatmentDescription;
  String? symptoms;
  String? pathogens;
  String? diseaseNameArabic;
  String? symptomsArabic;
  String? treatmentDescriptionArabic;
  String? pathogensArabic;
  bool? isHealthy;
  int? confidenceScore;
  String? submittedImgUrl;
  List<String>? relatedTags;
  List<RelatedArticles>? relatedArticles;

  PlantData(
      {this.diseaseId,
      this.diseaseName,
      this.treatmentDescription,
      this.symptoms,
      this.pathogens,
      this.diseaseNameArabic,
      this.symptomsArabic,
      this.treatmentDescriptionArabic,
      this.pathogensArabic,
      this.isHealthy,
      this.confidenceScore,
      this.submittedImgUrl,
      this.relatedTags,
      this.relatedArticles});

  PlantData.fromJson(Map<String, dynamic> json) {
    diseaseId = json['data']['diseaseId'] ?? 0;
    diseaseName = json['data']['diseaseName'] ?? 'Not Available';
    treatmentDescription =
        json['data']['treatmentDescription'] ?? 'Not Available';
    symptoms = json['data']['symptoms'] ?? 'Not Available';
    pathogens = json['data']['pathogens'] ?? 'Not Available';
    diseaseNameArabic = json['data']['diseaseName_Arabic'] ?? 'Not Available';
    symptomsArabic = json['data']['symptoms_Arabic'] ?? 'Not Available';
    treatmentDescriptionArabic =
        json['data']['treatmentDescription_Arabic'] ?? 'Not Available';
    pathogensArabic = json['data']['pathogens_Arabic'] ?? 'Not Available';
    isHealthy = json['data']['isHealthy'] ?? false;
    confidenceScore = json['data']['confidenceScore'] ?? 0;
    submittedImgUrl = json['data']['submittedImgUrl'] ?? 'Not Available';

    // Check for null before casting
    if (json['data']['relatedTags'] != null) {
      relatedTags = List<String>.from(json['data']['relatedTags']);
    } else {
      relatedTags = [];
    }

    if (json['data']['relatedArticles'] != null) {
      relatedArticles = <RelatedArticles>[];
      json['data']['relatedArticles'].forEach((v) {
        relatedArticles!.add(new RelatedArticles.fromJson(v));
      });
    } else {
      relatedArticles = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diseaseId'] = this.diseaseId;
    data['diseaseName'] = this.diseaseName;
    data['treatmentDescription'] = this.treatmentDescription;
    data['symptoms'] = this.symptoms;
    data['pathogens'] = this.pathogens;
    data['diseaseName_Arabic'] = this.diseaseNameArabic;
    data['symptoms_Arabic'] = this.symptomsArabic;
    data['treatmentDescription_Arabic'] = this.treatmentDescriptionArabic;
    data['pathogens_Arabic'] = this.pathogensArabic;
    data['isHealthy'] = this.isHealthy;
    data['confidenceScore'] = this.confidenceScore;
    data['submittedImgUrl'] = this.submittedImgUrl;
    data['relatedTags'] = this.relatedTags;
    if (this.relatedArticles != null) {
      data['relatedArticles'] =
          this.relatedArticles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedArticles {
  int? id;
  String? title;
  String? slug;
  String? releventImgUrl;

  RelatedArticles({this.id, this.title, this.slug, this.releventImgUrl});

  RelatedArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    releventImgUrl = json['releventImgUrl'] ?? 'Not Available';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['releventImgUrl'] = this.releventImgUrl;
    return data;
  }
}
