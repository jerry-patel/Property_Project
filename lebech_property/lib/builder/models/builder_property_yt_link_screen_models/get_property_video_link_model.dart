import 'dart:convert';

GetPropertyYtLinkModel getPropertyYtLinkModelFromJson(String str) => GetPropertyYtLinkModel.fromJson(json.decode(str));

String getPropertyYtLinkModelToJson(GetPropertyYtLinkModel data) => json.encode(data.toJson());

class GetPropertyYtLinkModel {
  GetPropertyYtLinkModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetPropertyYtLinkModel.fromJson(Map<String, dynamic> json) => GetPropertyYtLinkModel(
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

  List<YtLinkDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<YtLinkDatum>.from(json["data"].map((x) => YtLinkDatum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class YtLinkDatum {
  YtLinkDatum({
    required this.id,
    required this.link,
    required this.propertyId,
    required this.userId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String link;
  int propertyId;
  int userId;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory YtLinkDatum.fromJson(Map<String, dynamic> json) => YtLinkDatum(
    id: json["id"] ?? 0,
    link: json["link"] ?? "",
    propertyId: json["property_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "property_id": propertyId,
    "user_id": userId,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
