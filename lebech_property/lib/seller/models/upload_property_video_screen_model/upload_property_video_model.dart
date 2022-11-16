import 'dart:convert';

UploadPropertyVideoModel uploadPropertyVideoModelFromJson(String str) => UploadPropertyVideoModel.fromJson(json.decode(str));

String uploadPropertyVideoModelToJson(UploadPropertyVideoModel data) => json.encode(data.toJson());

class UploadPropertyVideoModel {
  UploadPropertyVideoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory UploadPropertyVideoModel.fromJson(Map<String, dynamic> json) => UploadPropertyVideoModel(
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
