import 'dart:convert';

DeletePropertyImageModel deletePropertyImageModelFromJson(String str) => DeletePropertyImageModel.fromJson(json.decode(str));

String deletePropertyImageModelToJson(DeletePropertyImageModel data) => json.encode(data.toJson());

class DeletePropertyImageModel {
  DeletePropertyImageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory DeletePropertyImageModel.fromJson(Map<String, dynamic> json) => DeletePropertyImageModel(
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