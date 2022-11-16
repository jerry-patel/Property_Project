import 'dart:convert';

UploadProjectVideoModel uploadProjectVideoModelFromJson(String str) => UploadProjectVideoModel.fromJson(json.decode(str));

String uploadProjectVideoModelToJson(UploadProjectVideoModel data) => json.encode(data.toJson());

class UploadProjectVideoModel {
  UploadProjectVideoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory UploadProjectVideoModel.fromJson(Map<String, dynamic> json) => UploadProjectVideoModel(
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
    required this.id,
  });

  String msg;
  String id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    msg: json["msg"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "id": id,
  };
}