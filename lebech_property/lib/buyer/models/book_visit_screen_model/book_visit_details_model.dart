import 'dart:convert';

BookVisitDetailsModel bookVisitDetailsModelFromJson(String str) => BookVisitDetailsModel.fromJson(json.decode(str));

String bookVisitDetailsModelToJson(BookVisitDetailsModel data) => json.encode(data.toJson());

class BookVisitDetailsModel {
  BookVisitDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory BookVisitDetailsModel.fromJson(Map<String, dynamic> json) => BookVisitDetailsModel(
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
    required this.property,
    required this.branch,
    required this.time,
  });

  Property property;
  List<Branch> branch;
  List<Time> time;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    property: Property.fromJson(json["property"] ?? {}),
    branch: List<Branch>.from(json["branch"].map((x) => Branch.fromJson(x)) ?? {}),
    time: List<Time>.from(json["time"].map((x) => Time.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "property": property.toJson(),
    "branch": List<dynamic>.from(branch.map((x) => x.toJson())),
    "time": List<dynamic>.from(time.map((x) => x.toJson())),
  };
}

class Property {
  Property({
    this.id,
    this.detail,
    this.propertyTypeId,
    this.postingFor,
    this.cityId,
    this.areaId,
    this.userId,
    this.title,
    this.bedrooms,
    this.balconies,
    this.hall,
    this.floorNumber,
    this.totalFloor,
    this.furnished,
    this.bathrooms,
    this.ac,
    this.bed,
    this.wardrobe,
    this.tv,
    this.fridge,
    this.sofa,
    this.washingMachine,
    this.diningTable,
    this.microwave,
    this.gas,
    this.carpetArea,
    this.superArea,
    this.availabilty,
    this.availabiltyDate,
    this.age,
    this.rent,
    this.securityDeposite,
    this.maintenance,
    this.maintenanceTenure,
    this.propertyTax,
    this.lift,
    this.flatFloor,
    this.utility,
    this.agree,
    this.status,
    this.video,
    this.favourite,
    this.propertySuper,
    this.negotiable,
    this.sortDesc,
    this.adminAprove,
    this.personalWashRoom,
    this.personalKeychain,
    this.cabin,
    this.personalLift,
    this.boundry,
    this.mainGate,
    this.openBoundry,
    this.securityCabin,
    this.yard,
    this.height,
    this.sqRate,
    this.createdAt,
    this.updatedAt,
    this.propertyImages,
    this.city,
    this.area,
    this.propertyTenant,
    this.propertyOwner,
    this.propertyType,
    // this.videos,
    // this.comments,
  });

  int? id;
  String? detail;
  int? propertyTypeId;
  String? postingFor;
  int? cityId;
  int? areaId;
  int? userId;
  String? title;
  String? bedrooms;
  String? balconies;
  String? hall;
  String? floorNumber;
  String? totalFloor;
  String? furnished;
  String? bathrooms;
  String? ac;
  String? bed;
  String? wardrobe;
  String? tv;
  String? fridge;
  String? sofa;
  String? washingMachine;
  String? diningTable;
  String? microwave;
  String? gas;
  String? carpetArea;
  String? superArea;
  String? availabilty;
  String? availabiltyDate;
  String? age;
  Rent? rent;
  String? securityDeposite;
  String? maintenance;
  String? maintenanceTenure;
  String? propertyTax;
  String? lift;
  String? flatFloor;
  String? utility;
  String? agree;
  String? status;
  String? video;
  String? favourite;
  String? propertySuper;
  String? negotiable;
  String? sortDesc;
  String? adminAprove;
  String? personalWashRoom;
  String? personalKeychain;
  String? cabin;
  String? personalLift;
  String? boundry;
  String? mainGate;
  String? openBoundry;
  String? securityCabin;
  String? yard;
  String? height;
  String? sqRate;
  String? createdAt;
  String? updatedAt;
  List<PropertyImage>? propertyImages;
  Area? city;
  Area? area;
  PropertyTenant? propertyTenant;
  PropertyOwner? propertyOwner;
  PropertyType? propertyType;
  // List<dynamic> videos;
  // List<dynamic> comments;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
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
    propertySuper: json["super"] ?? "",
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
    propertyImages: List<PropertyImage>.from(json["property_images"].map((x) => PropertyImage.fromJson(x)) ?? []),
    city: Area.fromJson(json["city"] ?? {}),
    area: Area.fromJson(json["area"] ?? {}),
    propertyTenant: PropertyTenant.fromJson(json["property_tenant"] ?? {}),
    propertyOwner: PropertyOwner.fromJson(json["property_owner"] ?? {}),
    propertyType: PropertyType.fromJson(json["property_type"] ?? {}),
    // videos: List<dynamic>.from(json["videos"].map((x) => x)),
    // comments: List<dynamic>.from(json["comments"].map((x) => x)),
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
    "rent": rent!.toJson(),
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
    "super": propertySuper,
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
    "property_images": List<dynamic>.from(propertyImages!.map((x) => x.toJson())),
    "city": city!.toJson(),
    "area": area!.toJson(),
    "property_tenant": propertyTenant!.toJson(),
    "property_owner": propertyOwner!.toJson(),
    "property_type": propertyType!.toJson(),
    // "videos": List<dynamic>.from(videos.map((x) => x)),
    // "comments": List<dynamic>.from(comments.map((x) => x)),
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
    restrictionTenant: json["restriction_tenant"].toString(),
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
    fromTime: json["from_time"].toString(),
    toTime: json["to_time"].toString(),
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
    flatFloor: json["flat_floor"].toString(),
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
    intrestingDetail: json["intresting_detail"].toString(),
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

class Branch {
  Branch({
    this.id,
    this.title,
    this.address,
    this.areaId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.area,
  });

  int? id;
  String? title;
  String? address;
  int? areaId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Area? area;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    address: json["address"] ?? "",
    areaId: json["area_id"] ?? 0,
    status: json["status"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    area: Area.fromJson(json["area"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "address": address,
    "area_id": areaId,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "area": area!.toJson(),
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

class Time {
  Time({
    this.id,
    this.slot,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? slot;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    id: json["id"] ?? 0,
    slot: json["slot"] ?? "",
    status: json["status"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slot": slot,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
