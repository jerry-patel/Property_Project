
import 'dart:convert';

GetPropertyVideoModel getPropertyVideoModelFromJson(String str) => GetPropertyVideoModel.fromJson(json.decode(str));

String getPropertyVideoModelToJson(GetPropertyVideoModel data) => json.encode(data.toJson());

class GetPropertyVideoModel {
  GetPropertyVideoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  GetPropertyVideoModelData data;

  factory GetPropertyVideoModel.fromJson(Map<String, dynamic> json) => GetPropertyVideoModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: GetPropertyVideoModelData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class GetPropertyVideoModelData {
  GetPropertyVideoModelData({
    required this.data,
  });

  DataData data;

  factory GetPropertyVideoModelData.fromJson(Map<String, dynamic> json) => GetPropertyVideoModelData(
    data: DataData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataData {
  DataData({
    required this.video,
  });

  String video;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    video: json["video"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "video": video,
  };
}