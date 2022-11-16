import 'dart:convert';

GetProjectBrochureModel getProjectBrochureModelFromJson(String str) => GetProjectBrochureModel.fromJson(json.decode(str));

String getProjectBrochureModelToJson(GetProjectBrochureModel data) => json.encode(data.toJson());

class GetProjectBrochureModel {
  GetProjectBrochureModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetProjectBrochureModel.fromJson(Map<String, dynamic> json) => GetProjectBrochureModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.data,
  });

  List<BrochureData> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<BrochureData>.from(json["data"].map((x) => BrochureData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BrochureData {
  BrochureData({
    required this.file,
    required this.id,
    required this.title,
    required this.projectId,
  });

  String file;
  int id;
  String title;
  int projectId;

  factory BrochureData.fromJson(Map<String, dynamic> json) => BrochureData(
    file: json["file"] ?? {},
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    projectId: json["project_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "file": file,
    "id": id,
    "title": title,
    "project_id": projectId,
  };
}
