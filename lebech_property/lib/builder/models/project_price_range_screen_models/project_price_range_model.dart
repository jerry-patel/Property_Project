import 'dart:convert';

ProjectPriceRangeModel projectPriceRangeModelFromJson(String str) => ProjectPriceRangeModel.fromJson(json.decode(str));

String projectPriceRangeModelToJson(ProjectPriceRangeModel data) => json.encode(data.toJson());

class ProjectPriceRangeModel {
  ProjectPriceRangeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectPriceRangeModel.fromJson(Map<String, dynamic> json) => ProjectPriceRangeModel(
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

  List<ProjectPriceRangeDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<ProjectPriceRangeDatum>.from(json["data"].map((x) => ProjectPriceRangeDatum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProjectPriceRangeDatum {
  ProjectPriceRangeDatum({
    required this.id,
    required this.type,
    required this.price,
    required this.area,
    required this.active,
    required this.projectId,
    required this.userId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String type;
  String price;
  String area;
  int active;
  int projectId;
  int userId;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory ProjectPriceRangeDatum.fromJson(Map<String, dynamic> json) => ProjectPriceRangeDatum(
    id: json["id"] ?? 0,
    type: json["type"] ?? "",
    price: json["price"] ?? "",
    area: json["area"] ?? "",
    active: json["active"] ?? 0,
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "price": price,
    "area": area,
    "active": active,
    "project_id": projectId,
    "user_id": userId,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
