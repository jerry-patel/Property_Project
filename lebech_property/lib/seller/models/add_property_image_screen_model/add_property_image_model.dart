// To parse this JSON data, do
//
//     final addPropertyImageModule = addPropertyImageModuleFromJson(jsonString);

import 'dart:convert';

AddPropertyImageModule addPropertyImageModuleFromJson(String str) => AddPropertyImageModule.fromJson(json.decode(str));

String addPropertyImageModuleToJson(AddPropertyImageModule data) => json.encode(data.toJson());

class AddPropertyImageModule {
  AddPropertyImageModule({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory AddPropertyImageModule.fromJson(Map<String, dynamic> json) => AddPropertyImageModule(
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
