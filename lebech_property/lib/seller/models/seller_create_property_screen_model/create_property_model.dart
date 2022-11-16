import 'dart:convert';

CreatePropertyModel createPropertyModelFromJson(String str) => CreatePropertyModel.fromJson(json.decode(str));

String createPropertyModelToJson(CreatePropertyModel data) => json.encode(data.toJson());

class CreatePropertyModel {
  CreatePropertyModel({
    required this.status,
    required this.message,
    required this.successData,
  });

  bool status;
  String message;
  SuccessData successData;

  factory CreatePropertyModel.fromJson(Map<String, dynamic> json) => CreatePropertyModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    successData: SuccessData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": successData.toJson(),
  };
}

class SuccessData {
  SuccessData({
    required this.msg,
    required this.id,
  });

  String msg;
  int id;

  factory SuccessData.fromJson(Map<String, dynamic> json) => SuccessData(
    msg: json["msg"] ?? "",
    id: json["id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "id": id,
  };
}