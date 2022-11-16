import 'dart:convert';

ProjectStatusChangeModel projectStatusChangeModelFromJson(String str) => ProjectStatusChangeModel.fromJson(json.decode(str));

String projectStatusChangeModelToJson(ProjectStatusChangeModel data) => json.encode(data.toJson());

class ProjectStatusChangeModel {
  ProjectStatusChangeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectStatusChangeModel.fromJson(Map<String, dynamic> json) => ProjectStatusChangeModel(
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
    required this.msg,
  });

  String msg;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    msg: json["msg"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
