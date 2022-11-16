import 'dart:convert';

VisitListModel visitListModelFromJson(String str) => VisitListModel.fromJson(json.decode(str));

String visitListModelToJson(VisitListModel data) => json.encode(data.toJson());

class VisitListModel {
  VisitListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory VisitListModel.fromJson(Map<String, dynamic> json) => VisitListModel(
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

  List<VisitDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<VisitDatum>.from(json["data"].map((x) => VisitDatum.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class VisitDatum {
  VisitDatum({
    required this.id,
    required this.status,
    required this.branch,
    required this.time,
    required this.property,
    required this.propertyId,
    required this.image,
  });

  int id;
  String status;
  String branch;
  String time;
  String property;
  int propertyId;
  List<Image> image;

  factory VisitDatum.fromJson(Map<String, dynamic> json) => VisitDatum(
    id: json["id"] ?? 0,
    status: json["status"] ?? "",
    branch: json["branch"] ?? "",
    time: json["time"] ?? "",
    property: json["property"] ?? "",
    propertyId: json["property_id"] ?? 0,
    image: List<Image>.from(json["image"].map((x) => Image.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "branch": branch,
    "time": time,
    "property": property,
    "property_id": propertyId,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    required this.id,
    required this.image,
    required this.imageDefault,
    required this.status,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String image;
  String imageDefault;
  String status;
  int propertyId;
  String createdAt;
  String updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] ?? 0,
    image: json["image"] ?? "",
    imageDefault: json["default"] ?? "",
    status: json["status"] ?? "",
    propertyId: json["property_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "default": imageDefault,
    "status": status,
    "property_id": propertyId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
