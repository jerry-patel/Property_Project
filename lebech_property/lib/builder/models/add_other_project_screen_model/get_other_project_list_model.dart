import 'dart:convert';

GetOtherProjectListModel getOtherProjectListModelFromJson(String str) => GetOtherProjectListModel.fromJson(json.decode(str));

String getOtherProjectListModelToJson(GetOtherProjectListModel data) => json.encode(data.toJson());

class GetOtherProjectListModel {
  GetOtherProjectListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetOtherProjectListModel.fromJson(Map<String, dynamic> json) => GetOtherProjectListModel(
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

  List<OtherProjectData> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<OtherProjectData>.from(json["data"].map((x) => OtherProjectData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OtherProjectData {
  OtherProjectData({
    required this.id,
    required this.name,
    required this.address,
    required this.createdAt,
    required this.projectId,
    required this.image,
  });

  int id;
  String name;
  String address;
  String createdAt;
  int projectId;
  String image;

  factory OtherProjectData.fromJson(Map<String, dynamic> json) => OtherProjectData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    createdAt: json["created_at"] ?? "",
    projectId: json["project_id"] ?? 0,
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "created_at": createdAt,
    "project_id": projectId,
    "image": image,
  };
}
