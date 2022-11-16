import 'dart:convert';

ProjectDetailsModel projectDetailsModelFromJson(String str) => ProjectDetailsModel.fromJson(json.decode(str));

String projectDetailsModelToJson(ProjectDetailsModel data) => json.encode(data.toJson());

class ProjectDetailsModel {
  ProjectDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  ProjectDetailsModelData data;

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) => ProjectDetailsModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    data: ProjectDetailsModelData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProjectDetailsModelData {
  ProjectDetailsModelData({
    required this.data,
  });

  DataData data;

  factory ProjectDetailsModelData.fromJson(Map<String, dynamic> json) => ProjectDetailsModelData(
    data: DataData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataData {
  DataData({
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
    required this.dataLibrary,
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
    required this.dataSuper,
    required this.createdAt,
    required this.updatedAt,
    required this.prices,
    required this.images,
    required this.nearBy,
    required this.videos,
    required this.city,
    required this.area,
    required this.projectCategory,
    required this.brochures,
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
  String dataLibrary;
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
  String dataSuper;
  String createdAt;
  String updatedAt;
  List<Price> prices;
  List<Image> images;
  List<NearBy> nearBy;
  List<Video> videos;
  Area city;
  Area area;
  ProjectCategory projectCategory;
  List<Brochure> brochures;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
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
    dataLibrary: json["library"] ?? "",
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
    dataSuper: json["super"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x)) ?? {}),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x)) ?? {}),
    nearBy: List<NearBy>.from(json["near_by"].map((x) => NearBy.fromJson(x)) ?? {}),
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x)) ?? {}),
    city: Area.fromJson(json["city"] ?? {}),
    area: Area.fromJson(json["area"] ?? {}),
    projectCategory: ProjectCategory.fromJson(json["project_category"] ?? {}),
    brochures: List<Brochure>.from(json["brochures"].map((x) => Brochure.fromJson(x)) ?? {}),
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
    "library": dataLibrary,
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
    "super": dataSuper,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "near_by": List<dynamic>.from(nearBy.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    "city": city.toJson(),
    "area": area.toJson(),
    "project_category": projectCategory.toJson(),
    "brochures": List<dynamic>.from(brochures.map((x) => x.toJson())),
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

class Brochure {
  Brochure({
    required this.id,
    required this.title,
    required this.file,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String file;
  int projectId;
  int userId;
  String createdAt;
  String updatedAt;

  factory Brochure.fromJson(Map<String, dynamic> json) => Brochure(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    file: json["file"] ?? "",
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "file": file,
    "project_id": projectId,
    "user_id": userId,
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

class NearBy {
  NearBy({
    required this.id,
    required this.name,
    required this.time,
    required this.active,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String time;
  int active;
  int projectId;
  int userId;
  String createdAt;
  String updatedAt;

  factory NearBy.fromJson(Map<String, dynamic> json) => NearBy(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    time: json["time"] ?? "",
    active: json["active"] ?? 0,
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "time": time,
    "active": active,
    "project_id": projectId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Price {
  Price({
    required this.id,
    required this.type,
    required this.price,
    required this.area,
    required this.active,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String type;
  String price;
  String area;
  int active;
  int projectId;
  int userId;
  String createdAt;
  String updatedAt;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"] ?? 0,
    type: json["type"] ?? "",
    price: json["price"] ?? "",
    area: json["area"] ?? "",
    active: json["active"] ?? 0,
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "price": price,
    "area": area,
    "active": active,
    "project_id": projectId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ProjectCategory {
  ProjectCategory({
    required this.id,
    required this.name,
    required this.status,
    required this.display,
    required this.priority,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String status;
  String display;
  int priority;
  String img;
  String createdAt;
  String updatedAt;

  factory ProjectCategory.fromJson(Map<String, dynamic> json) => ProjectCategory(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    status: json["status"] ?? "",
    display: json["display"] ?? "",
    priority: json["priority"] ?? 0,
    img: json["img"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "display": display,
    "priority": priority,
    "img": img,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Video {
  Video({
    required this.id,
    required this.link,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String link;
  int projectId;
  int userId;
  String createdAt;
  String updatedAt;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"] ?? 0,
    link: json["link"] ?? "",
    projectId: json["project_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "project_id": projectId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
