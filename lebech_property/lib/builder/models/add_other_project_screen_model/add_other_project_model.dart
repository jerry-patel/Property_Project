import 'dart:convert';

AddOtherProjectModel addOtherProjectModelFromJson(String str) => AddOtherProjectModel.fromJson(json.decode(str));

String addOtherProjectModelToJson(AddOtherProjectModel data) => json.encode(data.toJson());

class AddOtherProjectModel {
  AddOtherProjectModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory AddOtherProjectModel.fromJson(Map<String, dynamic> json) => AddOtherProjectModel(
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
