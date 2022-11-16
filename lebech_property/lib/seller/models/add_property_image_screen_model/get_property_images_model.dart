// To parse this JSON data, do
//
//     final propertyImagesModel = propertyImagesModelFromJson(jsonString);

import 'dart:convert';

PropertyImagesModel propertyImagesModelFromJson(String str) => PropertyImagesModel.fromJson(json.decode(str));

String propertyImagesModelToJson(PropertyImagesModel data) => json.encode(data.toJson());

class PropertyImagesModel {
  PropertyImagesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory PropertyImagesModel.fromJson(Map<String, dynamic> json) => PropertyImagesModel(
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
    required this.data,
  });

  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.image,
    required this.datumDefault,
    required this.id,
    required this.propertyId,
  });

  String image;
  String datumDefault;
  int id;
  int propertyId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    image: json["image"] ?? "",
    datumDefault: json["default"] ?? "",
    id: json["id"] ?? 0,
    propertyId: json["property_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "default": datumDefault,
    "id": id,
    "property_id": propertyId,
  };
}
