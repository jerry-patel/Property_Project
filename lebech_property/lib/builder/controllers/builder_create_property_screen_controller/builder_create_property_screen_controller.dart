import 'dart:convert';
import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/screens/builder_property_list_screen/add_property_images_screen/add_property_images_screen.dart';
import 'package:lebech_property/builder/screens/builder_property_list_screen/builder_property_list_screen.dart';
import 'package:lebech_property/buyer/models/property_details_model/property_details_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/create_property_model.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/property_features_checkbox_model.dart';

class BuilderCreatePropertyScreenController extends GetxController {
  PropertyGenerate propertyGenerate = Get.arguments[0] ?? PropertyGenerate.create;
  int propertyId = Get.arguments[1] ?? 0;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiHeader apiHeader = ApiHeader();

  int propertyDetailsId = 0;
  int propertyBasicId = 0;
  int propertyTenantId = 0;


  RxList<String> propertyForList = ["Sale", "Rent/Lease", "PG/Hostel"].obs;
  RxString propertyForValue = "Sale".obs;

  List<String> propertyNameList = [];
  String propertyNameValue = "";

  List<Property> propertyTypeList = [];
  Property propertyTypeValue = Property();
  RxString propertySub = "house".obs;

  List<BasicCity> cityList = [BasicCity(name: "Select City")];
  BasicCity cityValue = BasicCity(name: "Select City");

  List<BasicArea> areaList = [BasicArea(name: "Select Area")];
  BasicArea areaValue = BasicArea(name: "Select Area");
  List<String> stringAreaList = [];
  final areaDropDownProgKey = GlobalKey<DropdownSearchState<BasicArea>>();

  List<BasicState> stateList = [BasicState(name: "Select State")];
  BasicState stateValue = BasicState(name: "Select State");

  List<int> bedRoomList = [1,2,3,4,5,6,7,8,9,10];
  int bedRoomValue = 1;

  List<int> intList = [0,1,2,3,4,5,6,7,8,9,10];
  List<int> balconiesList = [0,1,2,3,4,5,6,7,8,9,10];
  int balconiesValue = 0;
  int bathRoomsValue = 0;
  int acValue = 0;
  int bedValue = 0;
  int wardrobeValue = 0;
  int tvValue = 0;
  RxBool isWithoutHall = false.obs;
  RxBool isNegotiable = false.obs;
  RxBool isMonthlyRentNegotiable = false.obs;

  List<String> furnishedList = ["Furnished", "Unfurnished", "Semi_Furnished"];
  RxString furnishedValue = "Furnished".obs;

  List<FeatureCheckboxModel> featuresCheckboxList = [
    FeatureCheckboxModel(name: "Fridge", value: false),
    FeatureCheckboxModel(name: "Sofa", value: false),
    FeatureCheckboxModel(name: "Washing Machine", value: false),
    FeatureCheckboxModel(name: "Dining Table", value: false),
    FeatureCheckboxModel(name: "Microwave", value: false),
    FeatureCheckboxModel(name: "Gas Connection", value: false),


    FeatureCheckboxModel(name: "Personal Wash Room", value: false), // 6
    FeatureCheckboxModel(name: "Personal Kitchen", value: false), // 7
    FeatureCheckboxModel(name: "Personal Cabin", value: false), // 8
    FeatureCheckboxModel(name: "Personal Lift", value: false), // 9
    FeatureCheckboxModel(name: "Security Cabin", value: false), // 10
    FeatureCheckboxModel(name: "Boundary", value: false), // 11
    FeatureCheckboxModel(name: "Main Gate", value: false), // 12
    FeatureCheckboxModel(name: "Some How Close Boundary", value: false), // 13
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController propertySortDescController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController totalFloorController = TextEditingController();
  TextEditingController superAreaController = TextEditingController();
  TextEditingController carpetAreaController = TextEditingController();
  TextEditingController varVighaYardController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController liftsInTowerController = TextEditingController();
  TextEditingController unitsOnFloorController = TextEditingController();
  // TextEditingController salePriceController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController securityDepositeController = TextEditingController();
  TextEditingController maintenanceChargeController = TextEditingController();
  TextEditingController perSqFtRateController = TextEditingController();
  TextEditingController totalCarParkingController = TextEditingController();
  TextEditingController coveredCarParkingController = TextEditingController();
  TextEditingController openCarParkingController = TextEditingController();
  TextEditingController tenantRestrictionController = TextEditingController();
  TextEditingController securityFeaturesController = TextEditingController();
  TextEditingController occupantsStayController = TextEditingController();
  TextEditingController landMarkAndNearByController = TextEditingController();

  PropertyAvailability propertyAvailability = PropertyAvailability.date;
  SeparateCleaningArea separateCleaningArea = SeparateCleaningArea.yes;

  List<String> ageOfConstructionList = [
    "Under Construction",
    "1 to 3 Year",
    "3 to 5 Year",
    "5 to 7 Year",
    "7 to 10 Year",
    "10 to 15 Year",
    "15 to 20 Year",
    "More then 20 Year",
  ];
  String ageOfConstructionValue = "Under Construction";

  List<String> maintenanceTenureList = [
    "Monthly", "Quarterly", "Half Yearly", "Yearly"
  ];
  String maintenanceTenureValue = "Monthly";

  List<String> propertyTaxPayableByList = [
    "Owner", "50-50", "Customer"
  ];
  String propertyTaxPayableByValue = "Owner";

  DateTime selectedDate = DateTime.now();

  TenantBachelors tenantBachelors = TenantBachelors.yes;
  TenantNonVegetarian tenantNonVegetarian = TenantNonVegetarian.yes;
  TenantPets tenantPets = TenantPets.yes;
  TenantCompanyLease tenantCompanyLease = TenantCompanyLease.yes;

  List<FeatureCheckboxModel> additionalRoomsList = [
    FeatureCheckboxModel(name: "Pooja Room", value: false),
    FeatureCheckboxModel(name: "Study", value: false),
    FeatureCheckboxModel(name: "Store", value: false),
    FeatureCheckboxModel(name: "Servant Room", value: false),
  ];

  List<String> facingList = [
    "East",
    "West",
    "North",
    "South",
    "South-East",
    "North-East",
    "North-West",
    "South-West",
  ];
  String facingValue = "East";

  List<FeatureCheckboxModel> overlookingList = [
    FeatureCheckboxModel(name: "Garden/Park", value: false),
    FeatureCheckboxModel(name: "Swimming Pool", value: false),
    FeatureCheckboxModel(name: "Main Road", value: false),
  ];

  RxInt totalCarParking = 0.obs;
  RxInt coveredCarParking = 0.obs;
  RxInt openCarParking = 0.obs;

  List<String> availabilityOfWaterList = [
    "", "24 Hours", "12 to 18 Hour", "18 to 24 Hour", "6 to 12 Hour",
    "3 to 6 Hour", "0 to 3 Hour"
  ];
  String availabilityOfWaterValue = "";
  String availabilityOfElectricityValue = "";


  List<FeatureCheckboxModel> flooringList = [
    FeatureCheckboxModel(name: "Ceramic Tiles", value: false),
    FeatureCheckboxModel(name: "Granite", value: false),
    FeatureCheckboxModel(name: "Marble", value: false),
    FeatureCheckboxModel(name: "Marbonite", value: false),
    FeatureCheckboxModel(name: "Mosaic", value: false),
    FeatureCheckboxModel(name: "Normal Tiles / Kotah Stone", value: false),
    FeatureCheckboxModel(name: "Vitrified", value: false),
    FeatureCheckboxModel(name: "Wooden", value: false),
  ];

  List<FeatureCheckboxModel> aminitiesList = [
    FeatureCheckboxModel(name: "Gymnasium", value: false),
    FeatureCheckboxModel(name: "Jogging & Strolling Track", value: false),
    FeatureCheckboxModel(name: "Lift", value: false),
    FeatureCheckboxModel(name: "Piped Gas", value: false),
    FeatureCheckboxModel(name: "Power Backup", value: false),
    FeatureCheckboxModel(name: "Reserved Parking", value: false),
    FeatureCheckboxModel(name: "Security", value: false),
    FeatureCheckboxModel(name: "Swimming Pool", value: false),
  ];

  VisitorsRestriction visitorsRestriction = VisitorsRestriction.noRestriction;

  List<FeatureCheckboxModel> preferTenantList = [
    FeatureCheckboxModel(name: "Businessman", value: false),
    FeatureCheckboxModel(name: "Self Employed", value: false),
    FeatureCheckboxModel(name: "Salaried", value: false),
    FeatureCheckboxModel(name: "Goverment Emp.", value: false),
    FeatureCheckboxModel(name: "Retired Emp.", value: false),
    FeatureCheckboxModel(name: "No Preference", value: false),
  ];


  RxBool isAnyTime = false.obs;
  PreferredDayCall preferredDayCall = PreferredDayCall.anyDay;

  List<String> timeList = [ "",
    "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM",
    "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM",
  ];
  String fromTimeValue = "";
  String toTimeValue = "";

  CrossViolation crossViolation = CrossViolation.yes;
  CommonWall commonWall = CommonWall.yes;
  RxBool isTermAndCondition = false.obs;

  /// Get Form Details From Api
  Future<void> getFormDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.basicDetailsApi;
    log("Basic Details Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url));
      log("getFormDetailsFunction Response : ${response.body}");

      FormBasicDetailsModel formBasicDetailsModel = FormBasicDetailsModel.fromJson(json.decode(response.body));
      log("formBasicDetailsModel : ${formBasicDetailsModel.data}");
      isSuccessStatus = formBasicDetailsModel.status.obs;

      if(isSuccessStatus.value) {
        propertyNameList.clear();
        propertyNameList = formBasicDetailsModel.data.name;

        propertyTypeList = formBasicDetailsModel.data.property;
        propertyTypeValue = propertyTypeList[0];

        cityList.addAll(formBasicDetailsModel.data.city);
        cityValue = cityList[0];

        areaList.addAll(formBasicDetailsModel.data.area);
        areaValue =areaList[0];
        stringAreaList.clear();
        for (var element in areaList) {
          stringAreaList.add("${element.name}");
        }

        stateList.addAll(formBasicDetailsModel.data.state);
        stateValue = stateList[0];

      } else {
        log("getFormDetailsFunction Else Else");
      }

    } catch(e) {
      log("getFormDetailsFunction Error ::: $e");
    } finally {

      if(propertyGenerate == PropertyGenerate.create) {
        isLoading(false);
      } else if(propertyGenerate == PropertyGenerate.update) {
        await getPropertyDetailsDataFunction();
      }

    }
  }

  Future<void> getPropertyDetailsDataFunction() async {
    isLoading(true);
    String url = ApiUrl.propertyDetailsApi;
    log("Url : $url");
    log("Property Id : $propertyId");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields["id"] = "$propertyId";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        PropertyDetailsModel propertyDetailsModel =
        PropertyDetailsModel.fromJson(json.decode(value));
        isSuccessStatus = propertyDetailsModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {

          propertyDetailsId = propertyDetailsModel.data.data.id;
          propertyTenantId = propertyDetailsModel.data.data.propertyTenant.id;
          propertyBasicId = propertyDetailsModel.data.data.propertyOwner.id;

          propertyNameController.text = propertyDetailsModel.data.data.title;
          securityDepositeController.text = propertyDetailsModel.data.data.securityDeposite;
          perSqFtRateController.text =propertyDetailsModel.data.data.sqRate;


          String details = propertyDetailsModel.data.data.detail;
          if(details == "sale") {
            propertyForValue.value = "Sale";
          } if(details == "rent") {
            propertyForValue.value = "Rent/Lease";
          } if(details == "pg") {
            propertyForValue.value = "PG/Hostel";
          }

          int propertyTypeId = propertyDetailsModel.data.data.propertyTypeId;
          for(int i =0; i < propertyTypeList.length; i++) {
            if(propertyTypeId == propertyTypeList[i].id) {
              propertyTypeValue = propertyTypeList[i];
            }
          }

          int cityId = propertyDetailsModel.data.data.cityId;
          for(int i = 0; i < cityList.length; i++) {
            if(cityId == cityList[i].id) {
              cityValue = cityList[i];
            }
          }

          int areaId = propertyDetailsModel.data.data.areaId;
          for(int i = 0; i < areaList.length; i++) {
            if(areaId == areaList[i].id) {
              areaValue = areaList[i];
            }
          }

          bedRoomValue = int.parse(propertyDetailsModel.data.data.bedrooms);
          if(propertyDetailsModel.data.data.hall == "true") {
            isWithoutHall.value = true;
          } else {
            isWithoutHall.value = false;
          }

          balconiesValue = int.parse(propertyDetailsModel.data.data.balconies);
          floorNoController.text = propertyDetailsModel.data.data.floorNumber;
          totalFloorController.text = propertyDetailsModel.data.data.totalFloor;

          String furnished = propertyDetailsModel.data.data.furnished;
          if(furnished == "furnished") {
            furnishedValue.value = "Furnished";
          } if(furnished == "unfurnished") {
            furnishedValue.value = "Unfurnished";
          } if(furnished == "semi_furnished") {
            furnishedValue.value = "Semi_Furnished";
          }

          bathRoomsValue = int.parse(propertyDetailsModel.data.data.bedrooms);
          acValue = int.parse(propertyDetailsModel.data.data.ac);
          bedValue = int.parse(propertyDetailsModel.data.data.bed);
          wardrobeValue = int.parse(propertyDetailsModel.data.data.wardrobe);
          tvValue = int.parse(propertyDetailsModel.data.data.tv);

          featuresCheckboxList[0] = FeatureCheckboxModel(
              name: "Fridge",
              value: propertyDetailsModel.data.data.fridge == "true"
                  ? true : false,
          );
          featuresCheckboxList[1] = FeatureCheckboxModel(
            name: "Sofa",
            value: propertyDetailsModel.data.data.sofa == "true"
                ? true : false,
          );
          featuresCheckboxList[2] = FeatureCheckboxModel(
            name: "Washing Machine",
            value: propertyDetailsModel.data.data.washingMachine == "true"
                ? true : false,
          );
          featuresCheckboxList[3] = FeatureCheckboxModel(
            name: "Dining Table",
            value: propertyDetailsModel.data.data.diningTable == "true"
                ? true : false,
          );
          featuresCheckboxList[4] = FeatureCheckboxModel(
            name: "Microwave",
            value: propertyDetailsModel.data.data.microwave == "true"
                ? true : false,
          );
          featuresCheckboxList[5] = FeatureCheckboxModel(
            name: "Gas Connection",
            value: propertyDetailsModel.data.data.gas == "true"
                ? true : false,
          );
          featuresCheckboxList[6] = FeatureCheckboxModel(
            name: "Personal Wash Room",
            value: propertyDetailsModel.data.data.personalWashRoom == "true"
                ? true : false,
          );
          featuresCheckboxList[7] = FeatureCheckboxModel(
            name: "Personal Kitchen",
            value: propertyDetailsModel.data.data.personalKeychain == "true"
                ? true : false,
          );
          featuresCheckboxList[8] = FeatureCheckboxModel(
            name: "Personal Cabin",
            value: propertyDetailsModel.data.data.cabin == "true"
                ? true : false,
          );
          featuresCheckboxList[9] = FeatureCheckboxModel(
            name: "Personal Lift",
            value: propertyDetailsModel.data.data.personalLift == "true"
                ? true : false,
          );
          featuresCheckboxList[10] = FeatureCheckboxModel(
            name: "Security Cabin",
            value: propertyDetailsModel.data.data.securityCabin == "true"
                ? true : false,
          );
          featuresCheckboxList[11] = FeatureCheckboxModel(
            name: "Boundary",
            value: propertyDetailsModel.data.data.boundry == "true"
                ? true : false,
          );
          featuresCheckboxList[12] = FeatureCheckboxModel(
            name: "Main Gate",
            value: propertyDetailsModel.data.data.mainGate == "true"
                ? true : false,
          );
          featuresCheckboxList[13] = FeatureCheckboxModel(
            name: "Some How Close Boundary",
            value: propertyDetailsModel.data.data.openBoundry == "true"
                ? true : false,
          );

          carpetAreaController.text = propertyDetailsModel.data.data.carpetArea;
          superAreaController.text = propertyDetailsModel.data.data.superArea;
          propertyDetailsModel.data.data.availabilty == "date"
              ? PropertyAvailability.date
              : PropertyAvailability.immediate;

          if(propertyDetailsModel.data.data.availabilty == "date" && propertyDetailsModel.data.data.availabiltyDate.isNotEmpty) {
            List<String> date = propertyDetailsModel.data.data.availabiltyDate
                .split('-');
            selectedDate = DateTime(
                int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
          }

          if (propertyDetailsModel.data.data.age == "0") {
            ageOfConstructionValue = "Under Construction";
          }
          if (propertyDetailsModel.data.data.age == "1") {
            ageOfConstructionValue = "1 to 3 Year";
          }
          if (propertyDetailsModel.data.data.age == "2") {
            ageOfConstructionValue = "3 to 5 Year";
          }
          if (propertyDetailsModel.data.data.age == "3") {
            ageOfConstructionValue = "5 to 7 Year";
          }
          if (propertyDetailsModel.data.data.age == "4") {
            ageOfConstructionValue = "7 to 10 Year";
          }
          if (propertyDetailsModel.data.data.age == "5") {
            ageOfConstructionValue = "10 to 15 Year";
          }
          if (propertyDetailsModel.data.data.age == "6") {
            ageOfConstructionValue = "15 to 20 Year";
          }
          if (propertyDetailsModel.data.data.age == "7") {
            ageOfConstructionValue = "More then 20 Year";
          }

          separateCleaningArea = propertyDetailsModel.data.data.utility == "true"
              ? SeparateCleaningArea.yes
              : SeparateCleaningArea.no;

          liftsInTowerController.text = propertyDetailsModel.data.data.lift;
          unitsOnFloorController.text = propertyDetailsModel.data.data.flatFloor;
          monthlyRentController.text = propertyDetailsModel.data.data.rent.rent.toString();
          isNegotiable.value = propertyDetailsModel.data.data.negotiable == "true" ? true : false;
          propertySortDescController.text = propertyDetailsModel.data.data.sortDesc;

          if(propertyDetailsModel.data.data.propertyTenant.poojaRoom == "true") {
            additionalRoomsList[0] = FeatureCheckboxModel(name: "Pooja Room", value: true);
          }
          if(propertyDetailsModel.data.data.propertyTenant.study == "true") {
            additionalRoomsList[1] = FeatureCheckboxModel(name: "Study", value: true);
          }
          if(propertyDetailsModel.data.data.propertyTenant.store == "true") {
            additionalRoomsList[2] = FeatureCheckboxModel(name: "Store", value: true);
          }
          if(propertyDetailsModel.data.data.propertyTenant.servantRoom == "true") {
            additionalRoomsList[3] = FeatureCheckboxModel(name: "Servant Room", value: true);
          }

        if(propertyDetailsModel.data.data.propertyTenant.facing == "east") {
        facingValue = "East";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "west") {
        facingValue = "West";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "north") {
        facingValue = "North";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "south") {
        facingValue = "South";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "south_east") {
        facingValue = "South-East";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "north_east") {
        facingValue = "North-East";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "north_west") {
        facingValue = "North-West";
        }
        if(propertyDetailsModel.data.data.propertyTenant.facing == "south_west") {
        facingValue = "South-West";
        }

        if(propertyDetailsModel.data.data.propertyTenant.garden == "true") {
          overlookingList[0] = FeatureCheckboxModel(name: "Garden/Park", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.pool == "true") {
          overlookingList[0] = FeatureCheckboxModel(name: "Swimming Pool", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.mainRoad == "true") {
          overlookingList[0] = FeatureCheckboxModel(name: "Main Road", value: true);
        }

        totalCarParkingController.text = propertyDetailsModel.data.data.propertyTenant.openCarParking.toString();
        coveredCarParkingController.text = propertyDetailsModel.data.data.propertyTenant.coveredCarParking.toString();
        openCarParkingController.text = propertyDetailsModel.data.data.propertyTenant.openCarParking.toString();


        if(propertyDetailsModel.data.data.propertyTenant.water == "") {
          availabilityOfWaterValue = "";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "24") {
          availabilityOfWaterValue = "24 Hours";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "18_24") {
        availabilityOfWaterValue = "18 to 24 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "12_18") {
        availabilityOfWaterValue = "12 to 18 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "6_12") {
        availabilityOfWaterValue = "6 to 12 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "3_6") {
        availabilityOfWaterValue = "3 to 6 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.water == "0_3") {
        availabilityOfWaterValue = "0 to 3 Hour";
        }

        if(propertyDetailsModel.data.data.propertyTenant.electricity == "") {
          availabilityOfElectricityValue = "";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "24") {
          availabilityOfElectricityValue = "24 Hours";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "18_24") {
          availabilityOfElectricityValue = "18 to 24 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "12_18") {
          availabilityOfElectricityValue = "12 to 18 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "6_12") {
          availabilityOfElectricityValue = "6 to 12 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "3_6") {
          availabilityOfElectricityValue = "3 to 6 Hour";
        }
        if(propertyDetailsModel.data.data.propertyTenant.electricity == "0_3") {
          availabilityOfElectricityValue = "0 to 3 Hour";
        }

        landMarkAndNearByController.text = propertyDetailsModel.data.data.propertyTenant.nearBy;

        if(propertyDetailsModel.data.data.propertyTenant.ceramicTiles == "true") {
          flooringList[0] = FeatureCheckboxModel(name: "Ceramic Tiles", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.granite == "true") {
          flooringList[1] = FeatureCheckboxModel(name: "Granite", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.marble == "true") {
          flooringList[2] = FeatureCheckboxModel(name: "Marble", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.marbonite == "true") {
          flooringList[3] = FeatureCheckboxModel(name: "Marbonite", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.mosaic == "true") {
          flooringList[4] = FeatureCheckboxModel(name: "Mosaic", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.normal == "true") {
          flooringList[5] = FeatureCheckboxModel(name: "Normal Tiles / Kotah Stone", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.vitrified == "true") {
          flooringList[6] = FeatureCheckboxModel(name: "Vitrified", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.wooden == "true") {
          flooringList[7] = FeatureCheckboxModel(name: "Wooden", value: true);
        }

        if(propertyDetailsModel.data.data.propertyTenant.gym == "true") {
          aminitiesList[0] = FeatureCheckboxModel(name: "Wooden", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.jogging == "true") {
          aminitiesList[1] = FeatureCheckboxModel(name: "Jogging & Strolling Track", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.liftAvailable == "true") {
          aminitiesList[2] = FeatureCheckboxModel(name: "Lift", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.pipeGas == "true") {
          aminitiesList[3] = FeatureCheckboxModel(name: "Piped Gas", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.powerBackup == "true") {
          aminitiesList[4] = FeatureCheckboxModel(name: "Power Backup", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.reservedParking == "true") {
          aminitiesList[5] = FeatureCheckboxModel(name: "Reserved Parking", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.security == "true") {
          aminitiesList[6] = FeatureCheckboxModel(name: "Security", value: true);
        }
        if(propertyDetailsModel.data.data.propertyTenant.swimmingPool == "true") {
          aminitiesList[7] = FeatureCheckboxModel(name: "Swimming Pool", value: true);
        }

          isAnyTime.value = propertyDetailsModel.data.data.propertyOwner.callAnytime == "true" ? true : false;

        if(propertyDetailsModel.data.data.propertyOwner.callDay == "any_day") {
          preferredDayCall = PreferredDayCall.anyDay;
        }
        if(propertyDetailsModel.data.data.propertyOwner.callDay == "weekdays_only") {
          preferredDayCall = PreferredDayCall.weekdaysOnly;
        }
        if(propertyDetailsModel.data.data.propertyOwner.callDay == "weekends_only") {
          preferredDayCall = PreferredDayCall.weekendsOnly;
        }
        if(propertyDetailsModel.data.data.propertyOwner.callDay == "sunday_only") {
          preferredDayCall = PreferredDayCall.sundayOnly;
        }
          fromTimeValue = propertyDetailsModel.data.data.propertyOwner.fromTime;
          toTimeValue = propertyDetailsModel.data.data.propertyOwner.toTime;
          securityFeaturesController.text = propertyDetailsModel.data.data.propertyOwner.security;
          occupantsStayController.text = propertyDetailsModel.data.data.propertyOwner.occupants;

          if(propertyDetailsModel.data.data.propertyOwner.crossVentilation == "true") {
            crossViolation = CrossViolation.yes;
          }
          if(propertyDetailsModel.data.data.propertyOwner.crossVentilation == "false") {
            crossViolation = CrossViolation.no;
          }

          if(propertyDetailsModel.data.data.propertyOwner.commonWall == "true") {
            commonWall = CommonWall.yes;
          }
          if(propertyDetailsModel.data.data.propertyOwner.commonWall == "false") {
            commonWall = CommonWall.no;
          }

          isTermAndCondition.value = true;


        } else {
          log("getPropertyDetailsDataFunction Else Else");
        }
      });
    } catch (e) {
      log("getPropertyDetailsDataFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }


  /// Get Search Property Name List Function
  Future<List<String>> getSearchNameListFunction(String searchText) async {


    return searchText.isEmpty
        ? propertyNameList
        : propertyNameList.where((element) {
      String searchListString = element.toLowerCase();
      String searchTextNew = searchText.toLowerCase();

      return searchListString.contains(searchTextNew);
    }).toList();

  }

  /// Create Property Function
  Future<void> createPropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.createBuilderPropertyDetailsApi;
    log("Create Builder Property Api Url : $url");

    try {
      Map<String, dynamic> data = mapData();
      log("data : ${jsonEncode(data)}");
      log("===================");
      log("apiHeader.builderHeader : ${apiHeader.sellerHeader}");
      log("===================");

      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader, body: jsonEncode(data));
      log("response : ${response.body}");
      log("sellerHeader : ${apiHeader.sellerHeader}");
      CreatePropertyModel createPropertyModel = CreatePropertyModel.fromJson(json.decode(response.body));
      isSuccessStatus = createPropertyModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: createPropertyModel.message);
        log("createPropertyModel.message : ${createPropertyModel.message}");
        Get.back();
        Get.to(
              () => AddBuilderPropertyImagesScreen(),
          transition: Transition.zoom,
          arguments: [
            createPropertyModel.successData.id,
            propertyNameController.text.trim()
          ],
        );

        // Get.off(()=> BuilderPropertyListScreen(), transition: Transition.leftToRight);
      } else {
        log("Create Property Else Else");
        Fluttertoast.showToast(msg: "Please try again!");
      }

    } catch(e) {
      log("Create Property Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  /// Create Property Field Data
  Map<String, dynamic> mapData() {
    String details = "";
    String age = "";
    String propertyTax = "";
    String visitorRestriction = "";
    String water = "";
    String electricity = "";
    bool separateClean = false;
    bool crossVenti = false;
    bool commonWall1 = false;
    String facing = "";

    if(facingValue == "East") {
      facing = "east";
    } if(facingValue == "West") {
      facing = "west";
    } if(facingValue == "North") {
      facing = "north";
    } if(facingValue == "South") {
      facing = "south";
    } if(facingValue == "South-East") {
      facing = "south_east";
    } if(facingValue == "North-East") {
      facing = "north_east";
    } if(facingValue == "North-West") {
      facing = "north_west";
    } if(facingValue == "South-West") {
      facing = "south_west";
    }

    if(SeparateCleaningArea.yes == separateCleaningArea) {
      separateClean = true;
    }

    if(CrossViolation.yes == crossViolation) {
      crossVenti = true;
    }

    if(CommonWall.yes == commonWall) {
      commonWall1 = true;
    }


    // Property For
    if (propertyForValue.toString() == "Sale") {
      details = "sale";
    } else if (propertyForValue.toString() == "Rent/Lease") {
      details = "rent";
    } else {
      details = "pg";
    }

    // For Age
    if (ageOfConstructionValue.toString() == "Under Construction") {
      age = "0";
    } else if (ageOfConstructionValue.toString() == "1 to 3 Year") {
      age = "1";
    } else if (ageOfConstructionValue.toString() == "3 to 5 Year") {
      age = "2";
    } else if (ageOfConstructionValue.toString() == "5 to 7 Year") {
      age = "3";
    } else if (ageOfConstructionValue.toString() == "7 to 10 Year") {
      age = "4";
    } else if (ageOfConstructionValue.toString() == "10 to 15 Year") {
      age = "5";
    } else if (ageOfConstructionValue.toString() == "15 to 20 Year") {
      age = "6";
    } else {
      age = "7";
    }

    // Property Tax
    if (propertyTaxPayableByValue.toString() == "Owner") {
      propertyTax = "owner";
    } else if (propertyTaxPayableByValue.toString() == "50-50") {
      propertyTax = "50";
    } else {
      propertyTax = "customer";
    }

    // Visitor Restriction
    if(VisitorsRestriction.noRestriction == visitorsRestriction) {
      visitorRestriction = "no_restriction";
    } else if(VisitorsRestriction.overNightStayNotAllow == visitorsRestriction) {
      visitorRestriction = "no_overnight_stay";
    } else {
      visitorRestriction = "no_visitor";
    }


    // Water
    if(availabilityOfWaterValue == "24 Hours") {
      water = "24";
    } else if(availabilityOfWaterValue == "18 to 24 Hour") {
      water = "18_24";
    } else if(availabilityOfWaterValue == "12 to 18 Hour") {
      water = "12_18";
    } else if(availabilityOfWaterValue == "6 to 12 Hour") {
      water = "6-12";
    } else if(availabilityOfWaterValue == "3 to 6 Hour") {
      water = "3_6";
    } else if(availabilityOfWaterValue == "0 to 3 Hour") {
      water = "0_3";
    }

    // Electricity
    if(availabilityOfElectricityValue == "24 Hours") {
      electricity = "24";
    } else if(availabilityOfElectricityValue == "18 to 24 Hour") {
      electricity = "18_24";
    } else if(availabilityOfElectricityValue == "12 to 18 Hour") {
      electricity = "12_18";
    } else if(availabilityOfElectricityValue == "6 to 12 Hour") {
      electricity = "6-12";
    } else if(availabilityOfElectricityValue == "3 to 6 Hour") {
      electricity = "3_6";
    } else if(availabilityOfElectricityValue == "0 to 3 Hour") {
      electricity = "0_3";
    }


    Map<String, dynamic> apiData = {
      "basic": {
        "detail":details,
        "property_type_id":propertyTypeValue.id,
        "city_id":cityValue.id,
        "area_id":areaValue.id,
        "title": propertyNameController.text,
        "bedrooms":bedRoomValue,
        "balconies":balconiesValue,
        "hall": isWithoutHall.value,
        "floor_number": floorNoController.text,
        "total_floor":totalFloorController.text,
        "furnished":furnishedValue.value.toLowerCase(),
        "bathrooms":"$bathRoomsValue",
        "ac":"$acValue",
        "bed":"$bedValue",
        "wardrobe":"$wardrobeValue",
        "tv":"$tvValue",
        "fridge": featuresCheckboxList[0].value,
        "sofa": featuresCheckboxList[1].value,
        "washing_machine":featuresCheckboxList[2].value,
        "dining_table":featuresCheckboxList[3].value,
        "microwave":featuresCheckboxList[4].value,
        "gas":featuresCheckboxList[5].value,
        "carpet_area":carpetAreaController.text.trim(),
        "super_area":superAreaController.text.trim(),
        "availabilty":propertyAvailability.name.toLowerCase(),
        "availabilty_date":"${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
        "age":age,
        "rent":monthlyRentController.text.trim(),
        "security_deposite":securityDepositeController.text.trim(),
        "maintenance":maintenanceChargeController.text.trim(),
        "maintenance_tenure":maintenanceTenureValue.toLowerCase(),
        "agree":true,
        "lift":liftsInTowerController.text.trim(),
        "flat_floor":unitsOnFloorController.text.trim(),
        "utility":separateClean,
        "negotiable":isNegotiable.value,
        "sort_desc":propertySortDescController.text.trim(),
        "property_tax":propertyTax,
        "personal_wash_room":featuresCheckboxList[6].value,
        "personal_keychain":featuresCheckboxList[7].value,
        "cabin":featuresCheckboxList[8].value,
        "personal_lift":featuresCheckboxList[9].value,
        "boundry":featuresCheckboxList[11].value,
        "main_gate":featuresCheckboxList[12].value,
        "open_boundry":featuresCheckboxList[13].value,
        "security_cabin":featuresCheckboxList[10].value,
        "yard":varVighaYardController.text.trim(),
        "height":heightController.text.trim(),
        "sq_rate":perSqFtRateController.text.trim()
      },
      "tenant":{
        "bachelors":tenantBachelors.name,
        "non_vegetarians":tenantNonVegetarian.name,
        "pets":tenantPets.name,
        "company_lease":tenantCompanyLease.name,
        "pooja_room":additionalRoomsList[0].value,
        "study":additionalRoomsList[1].value,
        "store":additionalRoomsList[2].value,
        "servant_room":additionalRoomsList[3].value,
        "facing":facing,
        "garden":overlookingList[0].value,
        "pool":overlookingList[1].value,
        "main_road":overlookingList[2].value,
        "water":water,
        "electricity":electricity,
        "ceramic_tiles":flooringList[0].value,
        "granite":flooringList[1].value,
        "marble":flooringList[2].value,
        "marbonite":flooringList[3].value,
        "mosaic":flooringList[4].value,
        "normal":flooringList[5].value,
        "vitrified":flooringList[6].value,
        "wooden":flooringList[7].value,
        "gym":aminitiesList[0].value,
        "jogging":aminitiesList[1].value,
        "lift_available":aminitiesList[2].value,
        "pipe_gas":aminitiesList[3].value,
        "power_backup":aminitiesList[4].value,
        "reserved_parking":aminitiesList[5].value,
        "security":aminitiesList[6].value,
        "swimming_pool":aminitiesList[7].value,
        "near_by":landMarkAndNearByController.text.trim(),
        "total_car_parking":totalCarParkingController.text.trim(),
        "covered_car_parking":coveredCarParkingController.text.trim(),
        "open_car_parking":openCarParkingController.text.trim()
      },
      "owner":{
        "restriction_visitors":visitorRestriction,
        "restriction_tenant":tenantRestrictionController.text.trim(),
        "businessman":preferTenantList[0].value,
        "self_employed":preferTenantList[1].value,
        "salaried":preferTenantList[2].value,
        "goverment":preferTenantList[3].value,
        "retired":preferTenantList[4].value,
        "no_preference":preferTenantList[5].value,
        "call_anytime":isAnyTime.value,
        "security":securityFeaturesController.text.trim(),
        "occupants":occupantsStayController.text.trim(),
        "cross_ventilation":crossVenti == false ? "no" : "yes",
        "common_wall":commonWall1,
        "from_time":fromTimeValue,
        "to_time":toTimeValue
      }
    };

    Map<String, dynamic> updateApiData = {
      "basic": {
        "id": propertyDetailsId,
        "detail":details,
        "property_type_id":propertyTypeValue.id,
        "city_id":cityValue.id,
        "area_id":areaValue.id,
        "title": propertyNameController.text,
        "bedrooms":bedRoomValue,
        "balconies":balconiesValue,
        "hall": isWithoutHall.value,
        "floor_number": floorNoController.text,
        "total_floor":totalFloorController.text,
        "furnished":furnishedValue.value.toLowerCase(),
        "bathrooms":"$bathRoomsValue",
        "ac":"$acValue",
        "bed":"$bedValue",
        "wardrobe":"$wardrobeValue",
        "tv":"$tvValue",
        "fridge": featuresCheckboxList[0].value,
        "sofa": featuresCheckboxList[1].value,
        "washing_machine":featuresCheckboxList[2].value,
        "dining_table":featuresCheckboxList[3].value,
        "microwave":featuresCheckboxList[4].value,
        "gas":featuresCheckboxList[5].value,
        "carpet_area":carpetAreaController.text.trim(),
        "super_area":superAreaController.text.trim(),
        "availabilty":propertyAvailability.name.toLowerCase(),
        "availabilty_date":"${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
        "age":age,
        "rent":monthlyRentController.text.trim(),
        "security_deposite":securityDepositeController.text.trim(),
        "maintenance":maintenanceChargeController.text.trim(),
        "maintenance_tenure":maintenanceTenureValue.toLowerCase(),
        "agree":true,
        "lift":liftsInTowerController.text.trim(),
        "flat_floor":unitsOnFloorController.text.trim(),
        "utility":separateClean,
        "negotiable":isNegotiable.value,
        "sort_desc":propertySortDescController.text.trim(),
        "property_tax":propertyTax,
        "personal_wash_room":featuresCheckboxList[6].value,
        "personal_keychain":featuresCheckboxList[7].value,
        "cabin":featuresCheckboxList[8].value,
        "personal_lift":featuresCheckboxList[9].value,
        "boundry":featuresCheckboxList[11].value,
        "main_gate":featuresCheckboxList[12].value,
        "open_boundry":featuresCheckboxList[13].value,
        "security_cabin":featuresCheckboxList[10].value,
        "yard":varVighaYardController.text.trim(),
        "height":heightController.text.trim(),
        "sq_rate":perSqFtRateController.text.trim()
      },
      "tenant":{
        "id": propertyTenantId,
        "bachelors":tenantBachelors.name,
        "non_vegetarians":tenantNonVegetarian.name,
        "pets":tenantPets.name,
        "company_lease":tenantCompanyLease.name,
        "pooja_room":additionalRoomsList[0].value,
        "study":additionalRoomsList[1].value,
        "store":additionalRoomsList[2].value,
        "servant_room":additionalRoomsList[3].value,
        "facing":facing,
        "garden":overlookingList[0].value,
        "pool":overlookingList[1].value,
        "main_road":overlookingList[2].value,
        "water":water,
        "electricity":electricity,
        "ceramic_tiles":flooringList[0].value,
        "granite":flooringList[1].value,
        "marble":flooringList[2].value,
        "marbonite":flooringList[3].value,
        "mosaic":flooringList[4].value,
        "normal":flooringList[5].value,
        "vitrified":flooringList[6].value,
        "wooden":flooringList[7].value,
        "gym":aminitiesList[0].value,
        "jogging":aminitiesList[1].value,
        "lift_available":aminitiesList[2].value,
        "pipe_gas":aminitiesList[3].value,
        "power_backup":aminitiesList[4].value,
        "reserved_parking":aminitiesList[5].value,
        "security":aminitiesList[6].value,
        "swimming_pool":aminitiesList[7].value,
        "near_by":landMarkAndNearByController.text.trim(),
        "total_car_parking":totalCarParkingController.text.trim(),
        "covered_car_parking":coveredCarParkingController.text.trim(),
        "open_car_parking":openCarParkingController.text.trim()
      },
      "owner":{
        "id": propertyBasicId,
        "restriction_visitors":visitorRestriction,
        "restriction_tenant":tenantRestrictionController.text.trim(),
        "businessman":preferTenantList[0].value,
        "self_employed":preferTenantList[1].value,
        "salaried":preferTenantList[2].value,
        "goverment":preferTenantList[3].value,
        "retired":preferTenantList[4].value,
        "no_preference":preferTenantList[5].value,
        "call_anytime":isAnyTime.value,
        "security":securityFeaturesController.text.trim(),
        "occupants":occupantsStayController.text.trim(),
        "cross_ventilation":crossVenti == false ? "no" : "yes",
        "common_wall":commonWall1,
        "from_time":fromTimeValue,
        "to_time":toTimeValue
      }
    };


    return propertyGenerate == PropertyGenerate.create ? apiData : updateApiData;
  }


  @override
  void onInit() {
    getFormDetailsFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}