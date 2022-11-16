import 'dart:convert';

UploadPropertyYtLinkModel uploadPropertyYtLinkModelFromJson(String str) => UploadPropertyYtLinkModel.fromJson(json.decode(str));

String uploadPropertyYtLinkModelToJson(UploadPropertyYtLinkModel data) => json.encode(data.toJson());

class UploadPropertyYtLinkModel {
  UploadPropertyYtLinkModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory UploadPropertyYtLinkModel.fromJson(Map<String, dynamic> json) => UploadPropertyYtLinkModel(
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