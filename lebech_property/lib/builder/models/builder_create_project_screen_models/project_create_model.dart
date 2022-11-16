/*import 'dart:convert';

ProjectCreateModel projectCreateModelFromJson(String str) => ProjectCreateModel.fromJson(json.decode(str));

String projectCreateModelToJson(ProjectCreateModel data) => json.encode(data.toJson());

class ProjectCreateModel {
  ProjectCreateModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectCreateModel.fromJson(Map<String, dynamic> json) => ProjectCreateModel(
    status: json["status"].toString().toLowerCase() == "true" ? true : false,
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
    required this.msg,
    required this.id,
  });

  String msg;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    msg: json["msg"] ?? "",
    id: json["id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "id": id,
  };
}*/

import 'dart:convert';

ProjectCreateModel projectCreateModelFromJson(String str) => ProjectCreateModel.fromJson(json.decode(str));

String projectCreateModelToJson(ProjectCreateModel data) => json.encode(data.toJson());

class ProjectCreateModel {
  ProjectCreateModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ProjectData data;

  factory ProjectCreateModel.fromJson(Map<String, dynamic> json) => ProjectCreateModel(
    status: json["status"].toString().toLowerCase() == "true" ? true : false,
    message: json["message"] ?? "",
    data: ProjectData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProjectData {
  ProjectData({
    required this.msg,
    required this.id,
  });

  String msg;
  int id;

  factory ProjectData.fromJson(Map<String, dynamic> json) => ProjectData(
    msg: json["msg"] ?? "",
    id: json["id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "id": id,
  };
}