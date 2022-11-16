// To parse this JSON data, do
//
//     final projectLogoModel = projectLogoModelFromJson(jsonString);

import 'dart:convert';

ProjectLogoModel projectLogoModelFromJson(String str) => ProjectLogoModel.fromJson(json.decode(str));

String projectLogoModelToJson(ProjectLogoModel data) => json.encode(data.toJson());

class ProjectLogoModel {
  ProjectLogoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ProjectLogoModelData data;

  factory ProjectLogoModel.fromJson(Map<String, dynamic> json) => ProjectLogoModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: ProjectLogoModelData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProjectLogoModelData {
  ProjectLogoModelData({
    required this.data,
  });

  DataData data;

  factory ProjectLogoModelData.fromJson(Map<String, dynamic> json) => ProjectLogoModelData(
    data: DataData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataData {
  DataData({
    required this.logo,
  });

  String logo;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    logo: json["logo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "logo": logo,
  };
}
