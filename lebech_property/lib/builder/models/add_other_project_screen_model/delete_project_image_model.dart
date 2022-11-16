// To parse this JSON data, do
//
//     final deleteProjectImageModel = deleteProjectImageModelFromJson(jsonString);

import 'dart:convert';

DeleteProjectImageModel deleteProjectImageModelFromJson(String str) => DeleteProjectImageModel.fromJson(json.decode(str));

String deleteProjectImageModelToJson(DeleteProjectImageModel data) => json.encode(data.toJson());

class DeleteProjectImageModel {
  DeleteProjectImageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory DeleteProjectImageModel.fromJson(Map<String, dynamic> json) => DeleteProjectImageModel(
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
