import 'dart:convert';

ProjectImageModel projectImageModelFromJson(String str) => ProjectImageModel.fromJson(json.decode(str));

String projectImageModelToJson(ProjectImageModel data) => json.encode(data.toJson());

class ProjectImageModel {
  ProjectImageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectImageModel.fromJson(Map<String, dynamic> json) => ProjectImageModel(
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

  List<ProjectImageDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<ProjectImageDatum>.from(json["data"].map((x) => ProjectImageDatum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProjectImageDatum {
  ProjectImageDatum({
    required this.image,
    required this.id,
    required this.datumDefault,
    required this.projectId,
  });

  String image;
  int id;
  int datumDefault;
  int projectId;

  factory ProjectImageDatum.fromJson(Map<String, dynamic> json) => ProjectImageDatum(
    image: json["image"] ?? "",
    id: json["id"] ?? 0,
    datumDefault: json["default"] ?? 0,
    projectId: json["project_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "id": id,
    "default": datumDefault,
    "project_id": projectId,
  };
}
