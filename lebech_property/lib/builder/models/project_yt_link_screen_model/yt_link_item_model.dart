import 'dart:convert';

YtLinkItemModel ytLinkItemModelFromJson(String str) => YtLinkItemModel.fromJson(json.decode(str));

String ytLinkItemModelToJson(YtLinkItemModel data) => json.encode(data.toJson());

class YtLinkItemModel {
  YtLinkItemModel({
    required this.link,
  });

  String link;

  factory YtLinkItemModel.fromJson(Map<String, dynamic> json) => YtLinkItemModel(
    link: json["link"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
