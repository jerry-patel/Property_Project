import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) => HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) => json.encode(data.toJson());

class HomeScreenModel {
  HomeScreenModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) => HomeScreenModel(
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
    required this.banner,
    required this.favourite,
    required this.dataSuper,
    required this.youtube,
    required this.area,
    required this.type,
    required this.favouriteProjects,
    required this.superProjects,
    required this.news,
    required this.feedback,
    required this.cities,
    required this.categoryNew,
  });

  List<Banner1> banner;
  List<Favourite> favourite;
  List<Favourite> dataSuper;
  List<Youtube> youtube;
  List<AreaElement> area;
  List<HomePropertyType> type;
  List<Project> favouriteProjects;
  List<Project> superProjects;
  List<News> news;
  List<dynamic> feedback;
  List<Cities> cities;
  List<CategoryNew> categoryNew;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banner: List<Banner1>.from(json["banner"].map((x) => Banner1.fromJson(x)) ?? {}),
    favourite: List<Favourite>.from(json["favourite"].map((x) => Favourite.fromJson(x))  ?? {}),
    dataSuper: List<Favourite>.from(json["super"].map((x) => Favourite.fromJson(x))  ?? {}),
    youtube: List<Youtube>.from(json["youtube"].map((x) => Youtube.fromJson(x))  ?? {}),
    area: List<AreaElement>.from(json["area"].map((x) => AreaElement.fromJson(x))  ?? {}),
    type: List<HomePropertyType>.from(json["type"].map((x) => HomePropertyType.fromJson(x))  ?? {}),
    favouriteProjects: List<Project>.from(json["favourite_projects"].map((x) => Project.fromJson(x))  ?? {}),
    superProjects: List<Project>.from(json["super_projects"].map((x) => Project.fromJson(x))  ?? {}),
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))  ?? {}),
    feedback: List<dynamic>.from(json["feedback"].map((x) => x)  ?? {}),
    cities: List<Cities>.from(json["cities"].map((x) => Cities.fromJson(x))),
    categoryNew: List<CategoryNew>.from(json["categories"].map((x) => CategoryNew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    "favourite": List<dynamic>.from(favourite.map((x) => x.toJson())),
    "super": List<dynamic>.from(dataSuper.map((x) => x.toJson())),
    "youtube": List<dynamic>.from(youtube.map((x) => x.toJson())),
    "area": List<dynamic>.from(area.map((x) => x.toJson())),
    "type": List<dynamic>.from(type.map((x) => x.toJson())),
    "favourite_projects": List<dynamic>.from(favouriteProjects.map((x) => x.toJson())),
    "super_projects": List<dynamic>.from(superProjects.map((x) => x.toJson())),
    "news": List<dynamic>.from(news.map((x) => x.toJson())),
    "feedback": List<dynamic>.from(feedback.map((x) => x)),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categoryNew.map((x) => x.toJson())),
  };
}

class AreaElement {
  AreaElement({
    required this.id,
    required this.name,
    required this.stateId,
    required this.cityId,
  });

  int id;
  String name;
  int stateId;
  int cityId;

  factory AreaElement.fromJson(Map<String, dynamic> json) => AreaElement(
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

class Banner1 {
  Banner1({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory Banner1.fromJson(Map<String, dynamic> json) => Banner1(
    id: json["id"] ?? 0,
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class Favourite {
  Favourite({
    required this.id,
    required this.detail,
    required this.propertyTypeId,
    required this.postingFor,
    required this.cityId,
    required this.areaId,
    required this.userId,
    required this.title,
    required this.bedrooms,
    required this.balconies,
    required this.hall,
    required this.floorNumber,
    required this.totalFloor,
    required this.furnished,
    required this.bathrooms,
    required this.ac,
    required this.bed,
    required this.wardrobe,
    required this.tv,
    required this.fridge,
    required this.sofa,
    required this.washingMachine,
    required this.diningTable,
    required this.microwave,
    required this.gas,
    required this.carpetArea,
    required this.superArea,
    required this.availabilty,
    required this.availabiltyDate,
    required this.age,
    required this.rent,
    required this.securityDeposite,
    required this.maintenance,
    required this.maintenanceTenure,
    required this.propertyTax,
    required this.lift,
    required this.flatFloor,
    required this.utility,
    required this.agree,
    required this.status,
    required this.video,
    required this.favourite,
    required this.favouriteSuper,
    required this.negotiable,
    required this.sortDesc,
    required this.adminAprove,
    required this.personalWashRoom,
    required this.personalKeychain,
    required this.cabin,
    required this.personalLift,
    required this.boundry,
    required this.mainGate,
    required this.openBoundry,
    required this.securityCabin,
    required this.yard,
    required this.height,
    required this.sqRate,
    required this.createdAt,
    required this.updatedAt,
    required this.propertyImages,
    required this.city,
    required this.area,
    required this.user,
    required this.propertyTenant,
    required this.propertyType,
  });

  int id;
  String detail;
  int propertyTypeId;
  String postingFor;
  int cityId;
  int areaId;
  int userId;
  String title;
  String bedrooms;
  String balconies;
  String hall;
  String floorNumber;
  String totalFloor;
  String furnished;
  String bathrooms;
  String ac;
  String bed;
  String wardrobe;
  String tv;
  String fridge;
  String sofa;
  String washingMachine;
  String diningTable;
  String microwave;
  String gas;
  String carpetArea;
  String superArea;
  String availabilty;
  String availabiltyDate;
  String age;
  Rent rent;
  String securityDeposite;
  String maintenance;
  String maintenanceTenure;
  String propertyTax;
  String lift;
  String flatFloor;
  String utility;
  String agree;
  String status;
  String video;
  String favourite;
  String favouriteSuper;
  String negotiable;
  String sortDesc;
  String adminAprove;
  String personalWashRoom;
  String personalKeychain;
  String cabin;
  String personalLift;
  String boundry;
  String mainGate;
  String openBoundry;
  String securityCabin;
  String yard;
  String height;
  String sqRate;
  String createdAt;
  String updatedAt;
  List<PropertyImage> propertyImages;
  CityClass city;
  AreaClass area;
  User user;
  PropertyTenant propertyTenant;
  HomePropertyType propertyType;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
    id: json["id"] ?? 0,
    detail: json["detail"] ?? "",
    propertyTypeId: json["property_type_id"] ?? 0,
    postingFor: json["posting_for"] ?? "",
    cityId: json["city_id"] ?? 0,
    areaId: json["area_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    title: json["title"] ?? "",
    bedrooms: json["bedrooms"] ?? "",
    balconies: json["balconies"] ?? "",
    hall: json["hall"] ?? "",
    floorNumber: json["floor_number"] ?? "",
    totalFloor: json["total_floor"] ?? "",
    furnished: json["furnished"] ?? "",
    bathrooms: json["bathrooms"] ?? "",
    ac: json["ac"] ?? "",
    bed: json["bed"] ?? "",
    wardrobe: json["wardrobe"] ?? "",
    tv: json["tv"] ?? "",
    fridge: json["fridge"] ?? "",
    sofa: json["sofa"] ?? "",
    washingMachine: json["washing_machine"] ?? "",
    diningTable: json["dining_table"] ?? "",
    microwave: json["microwave"] ?? "",
    gas: json["gas"] ?? "",
    carpetArea: json["carpet_area"] ?? "",
    superArea: json["super_area"] ?? "",
    availabilty: json["availabilty"] ?? "",
    availabiltyDate: json["availabilty_date"] ?? "",
    age: json["age"] ?? "",
    rent: Rent.fromJson(json["rent"] ?? {}),
    securityDeposite: json["security_deposite"] ?? "",
    maintenance: json["maintenance"] ?? "",
    maintenanceTenure: json["maintenance_tenure"] ?? "",
    propertyTax: json["property_tax"] ?? "",
    lift: json["lift"] ?? "",
    flatFloor: json["flat_floor"] ?? "",
    utility: json["utility"] ?? "",
    agree: json["agree"] ?? "",
    status: json["status"] ?? "",
    video: json["video"] ?? "",
    favourite: json["favourite"] ?? "",
    favouriteSuper: json["super"] ?? "",
    negotiable: json["negotiable"] ?? "",
    sortDesc: json["sort_desc"] ?? "",
    adminAprove: json["admin_aprove"] ?? "",
    personalWashRoom: json["personal_wash_room"] ?? "",
    personalKeychain: json["personal_keychain"] ?? "",
    cabin: json["cabin"] ?? "",
    personalLift: json["personal_lift"] ?? "",
    boundry: json["boundry"] ?? "",
    mainGate: json["main_gate"] ?? "",
    openBoundry: json["open_boundry"] ?? "",
    securityCabin: json["security_cabin"] ?? "",
    yard: json["yard"] ?? "",
    height: json["height"] ?? "",
    sqRate: json["sq_rate"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    propertyImages: List<PropertyImage>.from(json["property_images"].map((x) => PropertyImage.fromJson(x)) ?? {}),
    city: CityClass.fromJson(json["city"] ?? {}),
    area: AreaClass.fromJson(json["area"] ?? {}),
    user: User.fromJson(json["user"] ?? {}),
    propertyTenant: PropertyTenant.fromJson(json["property_tenant"] ?? {}),
    propertyType: HomePropertyType.fromJson(json["property_type"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "detail": detail,
    "property_type_id": propertyTypeId,
    "posting_for": postingFor,
    "city_id": cityId,
    "area_id": areaId,
    "user_id": userId,
    "title": title,
    "bedrooms": bedrooms,
    "balconies": balconies,
    "hall": hall,
    "floor_number": floorNumber,
    "total_floor": totalFloor,
    "furnished": furnished,
    "bathrooms": bathrooms,
    "ac": ac,
    "bed": bed,
    "wardrobe": wardrobe,
    "tv": tv,
    "fridge": fridge,
    "sofa": sofa,
    "washing_machine": washingMachine,
    "dining_table": diningTable,
    "microwave": microwave,
    "gas": gas,
    "carpet_area": carpetArea,
    "super_area": superArea,
    "availabilty": availabilty,
    "availabilty_date": availabiltyDate,
    "age": age,
    "rent": rent.toJson(),
    "security_deposite": securityDeposite,
    "maintenance": maintenance,
    "maintenance_tenure": maintenanceTenure,
    "property_tax": propertyTax,
    "lift": lift,
    "flat_floor": flatFloor,
    "utility": utility,
    "agree": agree,
    "status": status,
    "video": video,
    "favourite": favourite,
    "super": favouriteSuper,
    "negotiable": negotiable,
    "sort_desc": sortDesc,
    "admin_aprove": adminAprove,
    "personal_wash_room": personalWashRoom,
    "personal_keychain": personalKeychain,
    "cabin": cabin,
    "personal_lift": personalLift,
    "boundry": boundry,
    "main_gate": mainGate,
    "open_boundry": openBoundry,
    "security_cabin": securityCabin,
    "yard": yard,
    "height": height,
    "sq_rate": sqRate,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "property_images": List<dynamic>.from(propertyImages.map((x) => x.toJson())),
    "city": city.toJson(),
    "area": area.toJson(),
    "user": user.toJson(),
    "property_tenant": propertyTenant.toJson(),
    "property_type": propertyType.toJson(),
  };
}

class CityClass {
  CityClass({
    required this.id,
    required this.name,
    required this.status,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String status;
  int stateId;
  String createdAt;
  String updatedAt;

  factory CityClass.fromJson(Map<String, dynamic> json) => CityClass(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    status: json["status"] ?? "",
    stateId: json["state_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "state_id": stateId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class AreaClass {
  AreaClass({
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

  factory AreaClass.fromJson(Map<String, dynamic> json) => AreaClass(
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


class PropertyImage {
  PropertyImage({
    required this.id,
    required this.image,
    required this.propertyImageDefault,
    required this.status,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String image;
  String propertyImageDefault;
  String status;
  int propertyId;
  String createdAt;
  String updatedAt;

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json["id"] ?? 0,
    image: json["image"] ?? "",
    propertyImageDefault: json["default"] ?? "",
    status: json["status"] ?? "",
    propertyId: json["property_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "default": propertyImageDefault,
    "status": status,
    "property_id": propertyId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class PropertyTenant {
  PropertyTenant({
    required this.id,
    required this.bachelors,
    required this.nonVegetarians,
    required this.pets,
    required this.companyLease,
    required this.poojaRoom,
    required this.study,
    required this.store,
    required this.servantRoom,
    required this.facing,
    required this.garden,
    required this.pool,
    required this.mainRoad,
    required this.carParking,
    required this.lift,
    required this.flatFloor,
    required this.water,
    required this.electricity,
    required this.ceramicTiles,
    required this.granite,
    required this.marble,
    required this.marbonite,
    required this.mosaic,
    required this.normal,
    required this.vitrified,
    required this.wooden,
    required this.gym,
    required this.jogging,
    required this.liftAvailable,
    required this.pipeGas,
    required this.powerBackup,
    required this.reservedParking,
    required this.security,
    required this.swimmingPool,
    required this.intrestingDetail,
    required this.nearBy,
    required this.owner,
    required this.totalCarParking,
    required this.coveredCarParking,
    required this.openCarParking,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String bachelors;
  String nonVegetarians;
  String pets;
  String companyLease;
  String poojaRoom;
  String study;
  String store;
  String servantRoom;
  String facing;
  String garden;
  String pool;
  String mainRoad;
  String carParking;
  String lift;
  String flatFloor;
  String water;
  String electricity;
  String ceramicTiles;
  String granite;
  String marble;
  String marbonite;
  String mosaic;
  String normal;
  String vitrified;
  String wooden;
  String gym;
  String jogging;
  String liftAvailable;
  String pipeGas;
  String powerBackup;
  String reservedParking;
  String security;
  String swimmingPool;
  String intrestingDetail;
  String nearBy;
  String owner;
  int totalCarParking;
  int coveredCarParking;
  int openCarParking;
  int propertyId;
  String createdAt;
  String updatedAt;

  factory PropertyTenant.fromJson(Map<String, dynamic> json) => PropertyTenant(
    id: json["id"] ?? 0,
    bachelors: json["bachelors"] ?? "",
    nonVegetarians: json["non_vegetarians"] ?? "",
    pets: json["pets"] ?? "",
    companyLease: json["company_lease"] ?? "",
    poojaRoom: json["pooja_room"] ?? "",
    study: json["study"] ?? "",
    store: json["store"] ?? "",
    servantRoom: json["servant_room"] ?? "",
    facing: json["facing"] ?? "",
    garden: json["garden"] ?? "",
    pool: json["pool"] ?? "",
    mainRoad: json["main_road"] ?? "",
    carParking: json["car_parking"] ?? "",
    lift: json["lift"] ?? "",
    flatFloor: json["flat_floor"] ?? "",
    water: json["water"] ?? "",
    electricity: json["electricity"] ?? "",
    ceramicTiles: json["ceramic_tiles"] ?? "",
    granite: json["granite"] ?? "",
    marble: json["marble"] ?? "",
    marbonite: json["marbonite"] ?? "",
    mosaic: json["mosaic"] ?? "",
    normal: json["normal"] ?? "",
    vitrified: json["vitrified"] ?? "",
    wooden: json["wooden"] ?? "",
    gym: json["gym"] ?? "",
    jogging: json["jogging"] ?? "",
    liftAvailable: json["lift_available"] ?? "",
    pipeGas: json["pipe_gas"] ?? "",
    powerBackup: json["power_backup"] ?? "",
    reservedParking: json["reserved_parking"] ?? "",
    security: json["security"] ?? "",
    swimmingPool: json["swimming_pool"] ?? "",
    intrestingDetail: json["intresting_detail"] ?? "",
    nearBy: json["near_by"] ?? "",
    owner: json["owner"] ?? "",
    totalCarParking: json["total_car_parking"] ?? 0,
    coveredCarParking: json["covered_car_parking"] ?? 0,
    openCarParking: json["open_car_parking"] ?? 0,
    propertyId: json["property_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bachelors": bachelors,
    "non_vegetarians": nonVegetarians,
    "pets": pets,
    "company_lease": companyLease,
    "pooja_room": poojaRoom,
    "study": study,
    "store": store,
    "servant_room": servantRoom,
    "facing": facing,
    "garden": garden,
    "pool": pool,
    "main_road": mainRoad,
    "car_parking": carParking,
    "lift": lift,
    "flat_floor": flatFloor,
    "water": water,
    "electricity": electricity,
    "ceramic_tiles": ceramicTiles,
    "granite": granite,
    "marble": marble,
    "marbonite": marbonite,
    "mosaic": mosaic,
    "normal": normal,
    "vitrified": vitrified,
    "wooden": wooden,
    "gym": gym,
    "jogging": jogging,
    "lift_available": liftAvailable,
    "pipe_gas": pipeGas,
    "power_backup": powerBackup,
    "reserved_parking": reservedParking,
    "security": security,
    "swimming_pool": swimmingPool,
    "intresting_detail": intrestingDetail,
    "near_by": nearBy,
    "owner": owner,
    "total_car_parking": totalCarParking,
    "covered_car_parking": coveredCarParking,
    "open_car_parking": openCarParking,
    "property_id": propertyId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

/*class PropertyType {
  PropertyType({
    this.id,
    this.name,
    this.sub,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int? id;
  String? name;
  String? sub;
  int? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? category;

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    sub: json["sub"] ?? "",
    categoryId: json["category_id"] ?? 0,
    status: json["status"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    category: json["category"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sub": sub,
    "category_id": categoryId,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "category": category,
  };
}*/

class HomePropertyType {
  HomePropertyType({
    this.id,
    this.name,
    this.sub,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int? id;
  String? name;
  String? sub;
  int? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Category? category;

  factory HomePropertyType.fromJson(Map<String, dynamic> json) => HomePropertyType(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    sub: json["sub"] ?? "",
    categoryId: json["category_id"] ?? 0,
    status: json["status"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    category: Category.fromJson(json["category"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sub": sub,
    "category_id": categoryId,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "category": category!.toJson(),
  };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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


class Project {
  Project({
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
    required this.projectLibrary,
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
    required this.projectSuper,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.city,
    required this.area,
    required this.user,
    required this.prices,
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
  String projectLibrary;
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
  String projectSuper;
  String createdAt;
  String updatedAt;
  List<ImageNew> images;
  CityClass city;
  CityClass area;
  User user;
  List<Price> prices;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
    projectLibrary: json["library"] ?? "",
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
    projectSuper: json["super"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    images: List<ImageNew>.from(json["images"].map((x) => ImageNew.fromJson(x)) ?? {}),
    city: CityClass.fromJson(json["city"] ?? {}),
    area: CityClass.fromJson(json["area"] ?? {}),
    user: User.fromJson(json["user"] ?? {}),
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x)) ?? {}),
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
    "library": projectLibrary,
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
    "super": projectSuper,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "city": city.toJson(),
    "area": area.toJson(),
    "user": user.toJson(),
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
  };
}

class ImageNew {
  ImageNew({
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

  factory ImageNew.fromJson(Map<String, dynamic> json) => ImageNew(
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
    updatedAt: json["updated_at"] ??  "",
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

class News {
  News({
    required this.id,
    required this.title,
    required this.favourite,
    required this.author,
    required this.detail,
    required this.date,
    required this.createdAt,
    required this.image,
  });

  int id;
  String title;
  String favourite;
  String author;
  String detail;
  String date;
  String createdAt;
  String image;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    favourite: json["favourite"] ?? "",
    author: json["author"] ?? "",
    detail: json["detail"] ?? "",
    date: json["date"] ?? "",
    createdAt: json["created_at"] ?? "",
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "favourite": favourite,
    "author": author,
    "detail": detail,
    "date": date,
    "created_at": createdAt,
    "image": image,
  };
}

class Youtube {
  Youtube({
    required this.id,
    required this.link,
    required this.priority,
    required this.createdAt,
  });

  int id;
  String link;
  String priority;
  String createdAt;

  factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
    id: json["id"] ?? 0,
    link: json["link"] ?? "",
    priority: json["priority"] ?? "",
    createdAt: json["created_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "priority": priority,
    "created_at": createdAt,
  };
}

class Cities {
  Cities({
    this.id,
    this.name,
    this.stateId,
  });

  int? id;
  String? name;
  int? stateId;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    stateId: json["state_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
  };
}

class CategoryNew {
  CategoryNew({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory CategoryNew.fromJson(Map<String, dynamic> json) => CategoryNew(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}