/*
import 'dart:convert';

ProjectVideoModel projectVideoModelFromJson(String str) => ProjectVideoModel.fromJson(json.decode(str));

String projectVideoModelToJson(ProjectVideoModel data) => json.encode(data.toJson());

class ProjectVideoModel {
  ProjectVideoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ProjectVideoModelData data;

  factory ProjectVideoModel.fromJson(Map<String, dynamic> json) => ProjectVideoModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: ProjectVideoModelData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProjectVideoModelData {
  ProjectVideoModelData({
    required this.data,
  });

  DataData data;

  factory ProjectVideoModelData.fromJson(Map<String, dynamic> json) => ProjectVideoModelData(
    data: DataData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataData {
  DataData({
    required this.video,
  });

  String video;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    video: json["video"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "video": video,
  };
}
*/


import 'dart:convert';

ProjectVideoModel projectVideoModelFromJson(String str) => ProjectVideoModel.fromJson(json.decode(str));

String projectVideoModelToJson(ProjectVideoModel data) => json.encode(data.toJson());

class ProjectVideoModel {
  ProjectVideoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ProjectVideoModelData data;

  factory ProjectVideoModel.fromJson(Map<String, dynamic> json) => ProjectVideoModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: ProjectVideoModelData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProjectVideoModelData {
  ProjectVideoModelData({
    required this.data,
  });

  DataData data;

  factory ProjectVideoModelData.fromJson(Map<String, dynamic> json) => ProjectVideoModelData(
    data: DataData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataData {
  DataData({
    required this.video,
  });

  String video;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    video: json["video"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "video": video,
  };
}
