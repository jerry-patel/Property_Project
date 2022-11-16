import 'dart:convert';

BuyContactModel buyContactModelFromJson(String str) => BuyContactModel.fromJson(json.decode(str));

String buyContactModelToJson(BuyContactModel data) => json.encode(data.toJson());

class BuyContactModel {
  BuyContactModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory BuyContactModel.fromJson(Map<String, dynamic> json) => BuyContactModel(
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
