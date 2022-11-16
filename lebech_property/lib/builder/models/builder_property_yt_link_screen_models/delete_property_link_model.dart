import 'dart:convert';

DeletePropertyYtLinkModel deletePropertyYtLinkModelFromJson(String str) => DeletePropertyYtLinkModel.fromJson(json.decode(str));

String deletePropertyYtLinkModelToJson(DeletePropertyYtLinkModel data) => json.encode(data.toJson());

class DeletePropertyYtLinkModel {
  DeletePropertyYtLinkModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory DeletePropertyYtLinkModel.fromJson(Map<String, dynamic> json) => DeletePropertyYtLinkModel(
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
