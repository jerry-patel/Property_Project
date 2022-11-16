// To parse this JSON data, do
//
//     final projectListModel = projectListModelFromJson(jsonString);

import 'dart:convert';

ProjectListModel projectListModelFromJson(String str) => ProjectListModel.fromJson(json.decode(str));

String projectListModelToJson(ProjectListModel data) => json.encode(data.toJson());

class ProjectListModel {
  ProjectListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProjectListModel.fromJson(Map<String, dynamic> json) => ProjectListModel(
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

  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.logo,
    required this.video,
    required this.areaId,
    required this.cityId,
    required this.stateId,
    required this.userId,
    required this.projectCategoryId,
    required this.swimmingPool,
    required this.garden,
    required this.pergola,
    required this.sunDeck,
    required this.lawnTennisCourt,
    required this.videoDoorSecurity,
    required this.toddlerPool,
    required this.tableTennis,
    required this.basketballCourt,
    required this.clinic,
    required this.theater,
    required this.lounge,
    required this.salon,
    required this.aerobics,
    required this.visitorsParking,
    required this.spa,
    required this.crecheDayCare,
    required this.barbecue,
    required this.terraceGarden,
    required this.waterSoftenerPlant,
    required this.fountain,
    required this.multipurposeCourt,
    required this.amphitheatre,
    required this.businessLounge,
    required this.squashCourt,
    required this.cafeteria,
    required this.datumLibrary,
    required this.cricketPitch,
    required this.medicalCentre,
    required this.cardRoom,
    required this.restaurant,
    required this.sauna,
    required this.jacuzzi,
    required this.steamRoom,
    required this.highSpeedElevators,
    required this.football,
    required this.skatingRink,
    required this.groceryShop,
    required this.wiFi,
    required this.banquetHall,
    required this.partyLawn,
    required this.indoorGames,
    required this.cctv,
    required this.why,
    required this.about,
    required this.aboutBuilder,
    required this.siteAddress,
    required this.officeAddress,
    required this.phone,
    required this.email,
    required this.status,
    required this.adminAprove,
    required this.favourite,
    required this.datumSuper,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.city,
    required this.area,
    required this.user,
  });

  int id;
  String name;
  String logo;
  String video;
  int areaId;
  int cityId;
  int stateId;
  int userId;
  int projectCategoryId;
  String swimmingPool;
  String garden;
  String pergola;
  String sunDeck;
  String lawnTennisCourt;
  String videoDoorSecurity;
  String toddlerPool;
  String tableTennis;
  String basketballCourt;
  String clinic;
  String theater;
  String lounge;
  String salon;
  String aerobics;
  String visitorsParking;
  String spa;
  String crecheDayCare;
  String barbecue;
  String terraceGarden;
  String waterSoftenerPlant;
  String fountain;
  String multipurposeCourt;
  String amphitheatre;
  String businessLounge;
  String squashCourt;
  String cafeteria;
  String datumLibrary;
  String cricketPitch;
  String medicalCentre;
  String cardRoom;
  String restaurant;
  String sauna;
  String jacuzzi;
  String steamRoom;
  String highSpeedElevators;
  String football;
  String skatingRink;
  String groceryShop;
  String wiFi;
  String banquetHall;
  String partyLawn;
  String indoorGames;
  String cctv;
  String why;
  String about;
  String aboutBuilder;
  String siteAddress;
  String officeAddress;
  String phone;
  String email;
  String status;
  String adminAprove;
  String favourite;
  String datumSuper;
  String createdAt;
  String updatedAt;
  List<Image> images;
  Area city;
  Area area;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    logo: json["logo"] ?? "",
    video: json["video"] ?? "",
    areaId: json["area_id"] ?? 0,
    cityId: json["city_id"] ?? 0,
    stateId: json["state_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    projectCategoryId: json["project_category_id"] ?? 0,
    swimmingPool: json["swimming_pool"] ?? "",
    garden: json["garden"] ?? "",
    pergola: json["pergola"] ?? "",
    sunDeck: json["sun_deck"] ?? "",
    lawnTennisCourt: json["lawn_tennis_court"] ?? "",
    videoDoorSecurity: json["video_door_security"] ?? "",
    toddlerPool: json["toddler_pool"] ?? "",
    tableTennis: json["table_tennis"] ?? "",
    basketballCourt: json["basketball_court"] ?? "",
    clinic: json["clinic"] ?? "",
    theater: json["theater"] ?? "",
    lounge: json["lounge"] ?? "",
    salon: json["salon"] ?? "",
    aerobics: json["aerobics"] ?? "",
    visitorsParking: json["visitors_parking"] ?? "",
    spa: json["spa"] ?? "",
    crecheDayCare: json["creche_day_care"] ?? "",
    barbecue: json["barbecue"] ?? "",
    terraceGarden: json["terrace_garden"] ?? "",
    waterSoftenerPlant: json["water_softener_plant"] ?? "",
    fountain: json["fountain"] ?? "",
    multipurposeCourt: json["multipurpose_court"] ?? "",
    amphitheatre: json["amphitheatre"] ?? "",
    businessLounge: json["business_lounge"] ?? "",
    squashCourt: json["squash_court"] ?? "",
    cafeteria: json["cafeteria"] ?? "",
    datumLibrary: json["library"] ?? "",
    cricketPitch: json["cricket_pitch"] ?? "",
    medicalCentre: json["medical_centre"] ?? "",
    cardRoom: json["card_room"] ?? "",
    restaurant: json["restaurant"] ?? "",
    sauna: json["sauna"] ?? "",
    jacuzzi: json["jacuzzi"] ?? "",
    steamRoom: json["steam_room"] ?? "",
    highSpeedElevators: json["high_speed_elevators"] ?? "",
    football: json["football"] ?? "",
    skatingRink: json["skating_rink"] ?? "",
    groceryShop: json["grocery_shop"] ?? "",
    wiFi: json["wi_fi"] ?? "",
    banquetHall: json["banquet_hall"] ?? "",
    partyLawn: json["party_lawn"] ?? "",
    indoorGames: json["indoor_games"] ?? "",
    cctv: json["cctv"] ?? "",
    why: json["why"] ?? "",
    about: json["about"] ?? "",
    aboutBuilder: json["about_builder"] ?? "",
    siteAddress: json["site_address"] ?? "",
    officeAddress: json["office_address"] ?? "",
    phone: json["phone"] ?? "",
    email: json["email"] ?? "",
    status: json["status"] ?? "",
    adminAprove: json["admin_aprove"] ?? "",
    favourite: json["favourite"] ?? "",
    datumSuper: json["super"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x)) ?? {}),
    city: Area.fromJson(json["city"] ?? {}),
    area: Area.fromJson(json["area"] ?? {}),
    user: User.fromJson(json["user"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "video": video,
    "area_id": areaId,
    "city_id": cityId,
    "state_id": stateId,
    "user_id": userId,
    "project_category_id": projectCategoryId,
    "swimming_pool": swimmingPool,
    "garden": garden,
    "pergola": pergola,
    "sun_deck": sunDeck,
    "lawn_tennis_court": lawnTennisCourt,
    "video_door_security": videoDoorSecurity,
    "toddler_pool": toddlerPool,
    "table_tennis": tableTennis,
    "basketball_court": basketballCourt,
    "clinic": clinic,
    "theater": theater,
    "lounge": lounge,
    "salon": salon,
    "aerobics": aerobics,
    "visitors_parking": visitorsParking,
    "spa": spa,
    "creche_day_care": crecheDayCare,
    "barbecue": barbecue,
    "terrace_garden": terraceGarden,
    "water_softener_plant": waterSoftenerPlant,
    "fountain": fountain,
    "multipurpose_court": multipurposeCourt,
    "amphitheatre": amphitheatre,
    "business_lounge": businessLounge,
    "squash_court": squashCourt,
    "cafeteria": cafeteria,
    "library": datumLibrary,
    "cricket_pitch": cricketPitch,
    "medical_centre": medicalCentre,
    "card_room": cardRoom,
    "restaurant": restaurant,
    "sauna": sauna,
    "jacuzzi": jacuzzi,
    "steam_room": steamRoom,
    "high_speed_elevators": highSpeedElevators,
    "football": football,
    "skating_rink": skatingRink,
    "grocery_shop": groceryShop,
    "wi_fi": wiFi,
    "banquet_hall": banquetHall,
    "party_lawn": partyLawn,
    "indoor_games": indoorGames,
    "cctv": cctv,
    "why": why,
    "about": about,
    "about_builder": aboutBuilder,
    "site_address": siteAddress,
    "office_address": officeAddress,
    "phone": phone,
    "email": email,
    "status": status,
    "admin_aprove": adminAprove,
    "favourite": favourite,
    "super": datumSuper,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "city": city.toJson(),
    "area": area.toJson(),
    "user": user.toJson(),
  };
}

class Area {
  Area({
    required this.id,
    required this.name,
    required this.status,
    required this.stateId,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String status;
  int stateId;
  int cityId;
  String createdAt;
  String updatedAt;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    status: json["status"] ?? "",
    stateId: json["state_id"] ?? 0,
    cityId: json["city_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "state_id": stateId,
    "city_id": cityId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Image {
  Image({
    required this.id,
    required this.img,
    required this.imageDefault,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String img;
  int imageDefault;
  int projectId;
  int userId;
  String createdAt;
  String updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] ?? 0,
    img: json["img"] ?? "",
    imageDefault: json["default"] ?? 0,
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "default": imageDefault,
    "project_id": projectId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.roleId,
    required this.profilePhotoUrl,
  });

  int id;
  String name;
  int roleId;
  String profilePhotoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    roleId: json["role_id"] ?? 0,
    profilePhotoUrl: json["profile_photo_url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role_id": roleId,
    "profile_photo_url": profilePhotoUrl,
  };
}
