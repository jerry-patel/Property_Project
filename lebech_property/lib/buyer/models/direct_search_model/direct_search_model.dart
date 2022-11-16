import 'dart:convert';

DirectSearchModel directSearchModelFromJson(String str) => DirectSearchModel.fromJson(json.decode(str));

String directSearchModelToJson(DirectSearchModel data) => json.encode(data.toJson());

class DirectSearchModel {
  DirectSearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory DirectSearchModel.fromJson(Map<String, dynamic> json) => DirectSearchModel(
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
    required this.selected,
  });

  List<DirectSearchDatum> data;
  String selected;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<DirectSearchDatum>.from(json["data"].map((x) => DirectSearchDatum.fromJson(x)) ?? {}),
    selected: json["selected"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "selected": selected,
  };
}

class DirectSearchDatum {
  DirectSearchDatum({
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
    required this.datumSuper,
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
  String datumSuper;
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
  City city;
  Area area;
  PropertyTenant propertyTenant;
  PropertyType propertyType;

  factory DirectSearchDatum.fromJson(Map<String, dynamic> json) => DirectSearchDatum(
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
    datumSuper: json["super"] ?? "",
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
    city: City.fromJson(json["city"] ?? {}),
    area: Area.fromJson(json["area"] ?? {}),
    propertyTenant: PropertyTenant.fromJson(json["property_tenant"] ?? {}),
    propertyType: PropertyType.fromJson(json["property_type"] ?? {}),
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
    "super": datumSuper,
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
    "property_tenant": propertyTenant.toJson(),
    "property_type": propertyType.toJson(),
  };
}

class City {
  City({
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

  factory City.fromJson(Map<String, dynamic> json) => City(
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

class PropertyType {
  PropertyType({
    required this.id,
    required this.name,
    required this.sub,
    required this.categoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String sub;
  int categoryId;
  String status;
  String createdAt;
  String updatedAt;

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    sub: json["sub"] ?? "",
    categoryId: json["category_id"] ?? 0,
    status: json["status"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sub": sub,
    "category_id": categoryId,
    "status": status,
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
