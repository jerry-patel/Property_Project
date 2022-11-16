import 'dart:convert';

AddProjectPriceRangeModel addProjectPriceRangeModelFromJson(String str) => AddProjectPriceRangeModel.fromJson(json.decode(str));

String addProjectPriceRangeModelToJson(AddProjectPriceRangeModel data) => json.encode(data.toJson());

class AddProjectPriceRangeModel {
  AddProjectPriceRangeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory AddProjectPriceRangeModel.fromJson(Map<String, dynamic> json) => AddProjectPriceRangeModel(
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
    id: json["id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "id": id,
  };
}
