import 'dart:convert';

PropertyListModule propertyListModuleFromJson(String str) => PropertyListModule.fromJson(json.decode(str));

String propertyListModuleToJson(PropertyListModule data) => json.encode(data.toJson());

class PropertyListModule {
  PropertyListModule({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory PropertyListModule.fromJson(Map<String, dynamic> json) => PropertyListModule(
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

  List<SellerPropertyDatum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<SellerPropertyDatum>.from(json["data"].map((x) => SellerPropertyDatum.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SellerPropertyDatum {
  SellerPropertyDatum({
    required this.id,
    required this.title,
    required this.carpetArea,
    required this.superArea,
    required this.rent,
    required this.createdAt,
    required this.cityId,
    required this.propertyTypeId,
    required this.status,
    required this.detail,
    required this.propertyTenant,
    required this.propertyOwner,
    required this.propertyImages,
    required this.city,
    required this.propertyType,
  });

  int id;
  String title;
  String carpetArea;
  String superArea;
  Rent rent;
  String createdAt;
  int cityId;
  int propertyTypeId;
  String status;
  String detail;
  PropertyTenant propertyTenant;
  PropertyOwner propertyOwner;
  List<PropertyImage> propertyImages;
  City city;
  PropertyType propertyType;

  factory SellerPropertyDatum.fromJson(Map<String, dynamic> json) => SellerPropertyDatum(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    carpetArea: json["carpet_area"] ?? "",
    superArea: json["super_area"] ?? "",
    rent: Rent.fromJson(json["rent"] ?? {}),
    createdAt: json["created_at"] ?? "",
    cityId: json["city_id"] ?? 0,
    propertyTypeId: json["property_type_id"] ?? 0,
    status: json["status"] ?? "",
    detail: json["detail"] ?? "",
    propertyTenant: PropertyTenant.fromJson(json["property_tenant"] ?? {}),
    propertyOwner: PropertyOwner.fromJson(json["property_owner"] ?? {}),
    propertyImages: List<PropertyImage>.from(json["property_images"].map((x) => PropertyImage.fromJson(x ?? {}))),
    city: City.fromJson(json["city"] ?? {}),
    propertyType: PropertyType.fromJson(json["property_type"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "carpet_area": carpetArea,
    "super_area": superArea,
    "rent": rent.toJson(),
    "created_at": createdAt,
    "city_id": cityId,
    "property_type_id": propertyTypeId,
    "status": status,
    "detail": detail,
    "property_tenant": propertyTenant.toJson(),
    "property_owner": propertyOwner.toJson(),
    "property_images": List<dynamic>.from(propertyImages.map((x) => x.toJson())),
    "city": city.toJson(),
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

class PropertyOwner {
  PropertyOwner({
    required this.id,
    required this.age,
    required this.occupation,
    required this.restrictionVisitors,
    required this.restrictionTenant,
    required this.businessman,
    required this.selfEmployed,
    required this.salaried,
    required this.goverment,
    required this.retired,
    required this.noPreference,
    required this.callDay,
    required this.call9Am12Pm,
    required this.call12Pm3Pm,
    required this.call3Pm6Pm,
    required this.call6Pm9Pm,
    required this.callAnytime,
    required this.utility,
    required this.security,
    required this.occupants,
    required this.crossVentilation,
    required this.commonWall,
    required this.fromTime,
    required this.toTime,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String age;
  String occupation;
  String restrictionVisitors;
  String restrictionTenant;
  String businessman;
  String selfEmployed;
  String salaried;
  String goverment;
  String retired;
  String noPreference;
  String callDay;
  String call9Am12Pm;
  String call12Pm3Pm;
  String call3Pm6Pm;
  String call6Pm9Pm;
  String callAnytime;
  String utility;
  String security;
  String occupants;
  String crossVentilation;
  String commonWall;
  String fromTime;
  String toTime;
  int propertyId;
  String createdAt;
  String updatedAt;

  factory PropertyOwner.fromJson(Map<String, dynamic> json) => PropertyOwner(
    id: json["id"] ?? 0,
    age: json["age"] ?? "",
    occupation: json["occupation"] ?? "",
    restrictionVisitors: json["restriction_visitors"] ?? "",
    restrictionTenant: json["restriction_tenant"] ?? "",
    businessman: json["businessman"] ?? "",
    selfEmployed: json["self_employed"] ?? "",
    salaried: json["salaried"] ?? "",
    goverment: json["goverment"] ?? "",
    retired: json["retired"] ?? "",
    noPreference: json["no_preference"] ?? "",
    callDay: json["call_day"] ?? "",
    call9Am12Pm: json["call_9am_12pm"] ?? "",
    call12Pm3Pm: json["call_12pm_3pm"] ?? "",
    call3Pm6Pm: json["call_3pm_6pm"] ?? "",
    call6Pm9Pm: json["call_6pm_9pm"] ?? "",
    callAnytime: json["call_anytime"] ?? "",
    utility: json["utility"] ?? "",
    security: json["security"] ?? "",
    occupants: json["occupants"] ?? "",
    crossVentilation: json["cross_ventilation"] ?? "",
    commonWall: json["common_wall"] ?? "",
    fromTime: json["from_time"] ?? "",
    toTime: json["to_time"] ?? "",
    propertyId: json["property_id"] ?? 0,
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "occupation": occupation,
    "restriction_visitors": restrictionVisitors,
    "restriction_tenant": restrictionTenant,
    "businessman": businessman,
    "self_employed": selfEmployed,
    "salaried": salaried,
    "goverment": goverment,
    "retired": retired,
    "no_preference": noPreference,
    "call_day": callDay,
    "call_9am_12pm": call9Am12Pm,
    "call_12pm_3pm": call12Pm3Pm,
    "call_3pm_6pm": call3Pm6Pm,
    "call_6pm_9pm": call6Pm9Pm,
    "call_anytime": callAnytime,
    "utility": utility,
    "security": security,
    "occupants": occupants,
    "cross_ventilation": crossVentilation,
    "common_wall": commonWall,
    "from_time": fromTime,
    "to_time": toTime,
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
