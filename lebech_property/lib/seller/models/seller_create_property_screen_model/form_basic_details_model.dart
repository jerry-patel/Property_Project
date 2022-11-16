import 'dart:convert';

FormBasicDetailsModel formBasicDetailsModelFromJson(String str) => FormBasicDetailsModel.fromJson(json.decode(str));

String formBasicDetailsModelToJson(FormBasicDetailsModel data) => json.encode(data.toJson());

class FormBasicDetailsModel {
  FormBasicDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory FormBasicDetailsModel.fromJson(Map<String, dynamic> json) => FormBasicDetailsModel(
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
    required this.name,
    required this.property,
    required this.state,
    required this.city,
    required this.area,
    required this.category,
  });

  List<String> name;
  List<Property> property;
  List<BasicState> state;
  List<BasicCity> city;
  List<BasicArea> area;
  List<BasicCategory> category;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: List<String>.from(json["name"].map((x) => x ?? {})),
    property: List<Property>.from(json["property"].map((x) => Property.fromJson(x ?? {}))),
    state: List<BasicState>.from(json["state"].map((x) => BasicState.fromJson(x ?? {}))),
    city: List<BasicCity>.from(json["city"].map((x) => BasicCity.fromJson(x ?? {}))),
    area: List<BasicArea>.from(json["area"].map((x) => BasicArea.fromJson(x ?? {}))),
    category: List<BasicCategory>.from(json["category"].map((x) => BasicCategory.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "name": List<dynamic>.from(name.map((x) => x)),
    "property": List<dynamic>.from(property.map((x) => x.toJson())),
    "state": List<dynamic>.from(state.map((x) => x.toJson())),
    "city": List<dynamic>.from(city.map((x) => x.toJson())),
    "area": List<dynamic>.from(area.map((x) => x.toJson())),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class BasicArea {
  BasicArea({
    this.id,
    this.name,
    this.stateId,
    this.cityId,
  });

  int? id;
  String? name;
  int? stateId;
  int? cityId;

  factory BasicArea.fromJson(Map<String, dynamic> json) => BasicArea(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    stateId: json["state_id"] ?? 0,
    cityId: json["city_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "city_id": cityId,
  };
}

class Property {
  Property({
    this.id,
    this.name,
    this.category,
    this.categoryId,
    this.status,
    this.sub,
    this.createdAt,
  });

  int? id;
  String? name;
  String? category;
  int? categoryId;
  String? status;
  String? sub;
  String? createdAt;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    category: json["category"] ?? "",
    categoryId: json["category_id"] ?? 0,
    status: json["status"] ?? "",
    sub: json["sub"] ?? "",
    createdAt: json["created_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "category_id": categoryId,
    "status": status,
    "sub": sub,
    "created_at": createdAt,
  };
}

class BasicState {
  BasicState({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory BasicState.fromJson(Map<String, dynamic> json) => BasicState(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class BasicCity {
  BasicCity({
    this.id,
    this.name,
    this.stateId,
  });

  int? id;
  String? name;
  int? stateId;

  factory BasicCity.fromJson(Map<String, dynamic> json) => BasicCity(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
  };
}

class BasicCategory {
  BasicCategory({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory BasicCategory.fromJson(Map<String, dynamic> json) => BasicCategory(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}