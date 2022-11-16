import 'dart:convert';

ProjectNearByModel projectNearByModelFromJson(String str) => ProjectNearByModel.fromJson(json.decode(str));

String projectNearByModelToJson(ProjectNearByModel data) => json.encode(data.toJson());

class ProjectNearByModel {
  ProjectNearByModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectNearByModel.fromJson(Map<String, dynamic> json) => ProjectNearByModel(
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

  List<NearByDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<NearByDatum>.from(json["data"].map((x) => NearByDatum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NearByDatum {
  NearByDatum({
    required this.id,
    required this.name,
    required this.time,
    required this.active,
    required this.projectId,
    required this.userId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String name;
  String time;
  int active;
  int projectId;
  int userId;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory NearByDatum.fromJson(Map<String, dynamic> json) => NearByDatum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    time: json["time"] ?? "",
    active: json["active"] ?? 0,
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "time": time,
    "active": active,
    "project_id": projectId,
    "user_id": userId,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
