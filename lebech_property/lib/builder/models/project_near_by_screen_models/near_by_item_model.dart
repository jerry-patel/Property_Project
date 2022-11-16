import 'dart:convert';

NearByItemModel nearByItemModelFromJson(String str) => NearByItemModel.fromJson(json.decode(str));

String nearByItemModelToJson(NearByItemModel data) => json.encode(data.toJson());

class NearByItemModel {
  NearByItemModel({
    required this.name,
    required this.time,
    required this.active,
  });

  String name;
  String time;
  bool active;

  factory NearByItemModel.fromJson(Map<String, dynamic> json) => NearByItemModel(
    name: json["name"] ?? "",
    time: json["time"] ?? "",
    active: json["active"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "time": time,
    "active": active,
  };
}
