import 'dart:convert';

VisitBookedModel visitBookedModelFromJson(String str) => VisitBookedModel.fromJson(json.decode(str));

String visitBookedModelToJson(VisitBookedModel data) => json.encode(data.toJson());

class VisitBookedModel {
  VisitBookedModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory VisitBookedModel.fromJson(Map<String, dynamic> json) => VisitBookedModel(
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
