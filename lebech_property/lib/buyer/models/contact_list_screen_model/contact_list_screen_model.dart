import 'dart:convert';

ContactListModel contactListModelFromJson(String str) => ContactListModel.fromJson(json.decode(str));

String contactListModelToJson(ContactListModel data) => json.encode(data.toJson());

class ContactListModel {
  ContactListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ContactListData data;

  factory ContactListModel.fromJson(Map<String, dynamic> json) => ContactListModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: ContactListData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ContactListData {
  ContactListData({
    required this.data,
  });

  List<Datum> data;

  factory ContactListData.fromJson(Map<String, dynamic> json) => ContactListData(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.amount,
    required this.createdAt,
    required this.title,
    required this.rent,
    required this.owner,
    required this.mobile,
    required this.image,
    required this.area,
    required this.city,
  });

  int id;
  int amount;
  String createdAt;
  String title;
  Rent rent;
  String owner;
  String mobile;
  List<Image> image;
  String area;
  String city;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    amount: json["amount"] ?? 0,
    createdAt: json["created_at"] ?? "",
    title: json["title"] ?? "",
    rent: Rent.fromJson(json["rent"] ?? {}),
    owner: json["owner"] ?? "",
    mobile: json["mobile"] ?? "",
    image: List<Image>.from(json["image"].map((x) => Image.fromJson(x ?? {})) ?? []),
    area: json["area"] ?? "",
    city: json["city"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "created_at": createdAt,
    "title": title,
    "rent": rent.toJson(),
    "owner": owner,
    "mobile": mobile,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "area": area,
    "city": city,
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

class Rent {
  Rent({
    required this.rent,
    required this.charge,
    required this.word,
  });

  int rent;
  int charge;
  String word;

  factory Rent.fromJson(Map<String, dynamic> json) => Rent(
    rent: json["rent"] ?? 0,
    charge: json["charge"] ?? 0,
    word: json["word"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "rent": rent,
    "charge": charge,
    "word": word,
  };
}
