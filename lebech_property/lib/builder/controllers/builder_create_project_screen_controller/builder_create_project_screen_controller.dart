import 'dart:convert';
import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_create_project_screen_models/facilities_model.dart';
import 'package:lebech_property/builder/models/builder_create_project_screen_models/project_create_model.dart';
import 'package:lebech_property/builder/screens/builder_create_project_screen/builder_create_project_screen_widgets.dart';
import 'package:lebech_property/buyer/models/project_details_model/project_details_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';

class BuilderCreateProjectScreenController extends GetxController {
  PropertyGenerate propertyGenerate = Get.arguments[0] ?? PropertyGenerate.create;
  int projectId = Get.arguments[1] ?? 0;


  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  int updateProjectId = 0;
  List<String> propertyNameList = [];
  String propertyNameValue = "";

  List<Property> propertyTypeList = [];
  Property propertyTypeValue = Property();

  List<BasicCity> cityList = [BasicCity(name: "Select City")];
  BasicCity cityValue = BasicCity(name: "Select City");

  List<BasicArea> areaList = [BasicArea(name: "Select Area")];
  BasicArea areaValue = BasicArea(name: "Select Area");
  List<String> stringProjectAreaList = [];
  final projectAreaDropDownProgKey = GlobalKey<DropdownSearchState<BasicArea>>();
  // SingleValueDropDownController areaDropDownController = SingleValueDropDownController();

  List<BasicCategory> categoryList = [BasicCategory(name: "Select Category")];
  BasicCategory categoryValue = BasicCategory(name: "Select Category");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectAddressController = TextEditingController();
  TextEditingController projectOfficeAddressController =
      TextEditingController();
  TextEditingController projectPhoneNoController = TextEditingController();
  TextEditingController projectEmailController = TextEditingController();
  TextEditingController whyConsiderProjectController = TextEditingController();
  TextEditingController moreAboutProjectController = TextEditingController();
  TextEditingController aboutBuilderController = TextEditingController();

  // QuillController whyConsiderProjectQuillController = QuillController.basic();
  // QuillController moreAboutProjectQuillController = QuillController.basic();
  // QuillController aboutBuilderQuillController = QuillController.basic();

  // List<PriceRangeSingleItemModule> priceRangeList = [
  //   PriceRangeSingleItemModule()
  // ];
  // List<AddNearBySingleModule> addNearByList = [AddNearBySingleModule()];
  // List<YouTubeVideoLinkModule> ytVideoLinkList = [YouTubeVideoLinkModule()];

  /// Get Form Details From Api
  Future<void> getFormDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.basicDetailsApi;
    log("Basic Details Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url));
      log("getFormDetailsFunction Response : ${response.body}");

      FormBasicDetailsModel formBasicDetailsModel =
          FormBasicDetailsModel.fromJson(json.decode(response.body));
      log("formBasicDetailsModel : ${formBasicDetailsModel.data}");
      isSuccessStatus = formBasicDetailsModel.status.obs;

      if (isSuccessStatus.value) {
        propertyNameList.clear();
        propertyNameList = formBasicDetailsModel.data.name;

        propertyTypeList = formBasicDetailsModel.data.property;
        propertyTypeValue = propertyTypeList[0];

        cityList.addAll(formBasicDetailsModel.data.city);
        cityValue = cityList[0];

        areaList.addAll(formBasicDetailsModel.data.area);
        areaValue = areaList[0];
        stringProjectAreaList.clear();
        for (var element in areaList) {
          stringProjectAreaList.add("${element.name}");
        }

        categoryList.addAll(formBasicDetailsModel.data.category);
        categoryValue = categoryList[0];
      } else {
        log("getFormDetailsFunction Else Else");
      }
    } catch (e) {
      log("getFormDetailsFunction Error ::: $e");
    } finally {
      if(propertyGenerate == PropertyGenerate.create) {
        isLoading(false);
      } else if(propertyGenerate == PropertyGenerate.update) {
        await getProjectDetailsDataFunction();
      }
    }
  }

  getProjectDetailsDataFunction() async {
    isLoading(true);
    String url = ApiUrl.projectDetailsApi;
    log("URL : $url");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['id'] = "$projectId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectDetailsModel projectDetailsModel = ProjectDetailsModel.fromJson(json.decode(value));
        isSuccessStatus = projectDetailsModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {

          updateProjectId = projectDetailsModel.data.data.id;

          projectNameController.text = projectDetailsModel.data.data.name;

          int cityId = projectDetailsModel.data.data.cityId;
          for(int i = 0; i < cityList.length; i++) {
            if(cityId == cityList[i].id) {
              cityValue = cityList[i];
            }
          }

          int areaId = projectDetailsModel.data.data.areaId;
          for(int i = 0; i < areaList.length; i++) {
            if(areaId == areaList[i].id) {
              areaValue = areaList[i];
            }
          }

          int categoryId = projectDetailsModel.data.data.projectCategoryId;
          for(int i = 0; i < categoryList.length; i++) {
            if(categoryId == categoryList[i].id) {
              categoryValue = categoryList[i];
            }
          }


          whyConsiderProjectController.text = projectDetailsModel.data.data.why;
          moreAboutProjectController.text = projectDetailsModel.data.data.about;
          aboutBuilderController.text = projectDetailsModel.data.data.aboutBuilder;
          projectAddressController.text = projectDetailsModel.data.data.siteAddress;
          projectOfficeAddressController.text = projectDetailsModel.data.data.officeAddress;
          projectPhoneNoController.text = projectDetailsModel.data.data.phone;
          projectEmailController.text = projectDetailsModel.data.data.email.toLowerCase();


          if(projectDetailsModel.data.data.swimmingPool == "true") {
            facilitiesList[0] = Facilities(name: "Swimming Pool", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.garden == "true") {
            facilitiesList[1] = Facilities(name: "Garden", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.pergola == "true") {
            facilitiesList[2] = Facilities(name: "Pergola", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.sunDeck == "true") {
            facilitiesList[3] = Facilities(name: "Sun Deck", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.lawnTennisCourt == "true") {
            facilitiesList[4] = Facilities(name: "Lawn Tennis Court", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.videoDoorSecurity == "true") {
            facilitiesList[5] = Facilities(name: "Video Door Security", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.toddlerPool == "true") {
            facilitiesList[6] = Facilities(name: "Toddler Pool", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.tableTennis == "true") {
            facilitiesList[7] = Facilities(name: "Table Tennis", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.basketballCourt == "true") {
            facilitiesList[8] = Facilities(name: "Basketball Court", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.clinic == "true") {
            facilitiesList[9] = Facilities(name: "Clinic", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.theater == "true") {
            facilitiesList[10] = Facilities(name: "Theater", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.lounge == "true") {
            facilitiesList[11] = Facilities(name: "Lounge", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.salon == "true") {
            facilitiesList[12] = Facilities(name: "Salon", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.aerobics == "true") {
            facilitiesList[13] = Facilities(name: "Aerobics", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.visitorsParking == "true") {
            facilitiesList[14] = Facilities(name: "Visitors Parking", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.spa == "true") {
            facilitiesList[15] = Facilities(name: "Spa", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.crecheDayCare == "true") {
            facilitiesList[16] = Facilities(name: "Creche Day Care", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.barbecue == "true") {
            facilitiesList[17] = Facilities(name: "Barbecue", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.terraceGarden == "true") {
            facilitiesList[18] = Facilities(name: "Terrace Garden", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.waterSoftenerPlant == "true") {
            facilitiesList[19] = Facilities(name: "Water Softener Plant", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.fountain == "true") {
            facilitiesList[20] = Facilities(name: "Fountain", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.multipurposeCourt == "true") {
            facilitiesList[21] = Facilities(name: "Multipurpose Court", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.amphitheatre == "true") {
            facilitiesList[22] = Facilities(name: "Amphitheatre Court", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.businessLounge == "true") {
            facilitiesList[23] = Facilities(name: "Business Lounge", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.squashCourt == "true") {
            facilitiesList[24] = Facilities(name: "Squash Court", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.cafeteria == "true") {
            facilitiesList[25] = Facilities(name: "Cafeteria", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.dataLibrary == "true") {
            facilitiesList[26] = Facilities(name: "Library", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.cricketPitch == "true") {
            facilitiesList[27] = Facilities(name: "Cricket Pitch", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.medicalCentre == "true") {
            facilitiesList[28] = Facilities(name: "Medical Centre", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.cardRoom == "true") {
            facilitiesList[29] = Facilities(name: "Card Room", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.restaurant == "true") {
            facilitiesList[30] = Facilities(name: "Restaurant", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.sauna == "true") {
            facilitiesList[31] = Facilities(name: "Sauna", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.jacuzzi == "true") {
            facilitiesList[32] = Facilities(name: "Jacuzzi", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.steamRoom == "true") {
            facilitiesList[33] = Facilities(name: "Steam Room", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.highSpeedElevators == "true") {
            facilitiesList[34] = Facilities(name: "High Speed Elevators", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.football == "true") {
            facilitiesList[35] = Facilities(name: "Football", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.skatingRink == "true") {
            facilitiesList[36] = Facilities(name: "Skating Rink", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.groceryShop == "true") {
            facilitiesList[37] = Facilities(name: "Grocery Shop", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.wiFi == "true") {
            facilitiesList[38] = Facilities(name: "Wi-Fi", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.banquetHall == "true") {
            facilitiesList[39] = Facilities(name: "Banquet Hall", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.partyLawn == "true") {
            facilitiesList[40] = Facilities(name: "Party Lawn", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.indoorGames == "true") {
            facilitiesList[41] = Facilities(name: "Indoor Games", isSelected: true, value: "");
          }
          if(projectDetailsModel.data.data.cctv == "true") {
            facilitiesList[42] = Facilities(name: "CCTV Camera", isSelected: true, value: "");
          }



        } else {
          log("getProjectListFunction Else Else");
        }

      });

    } catch(e) {
      log("getProjectDetailsFunction Error :: $e");
    } finally{
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

  List<Facilities> facilitiesList = [
    Facilities(isSelected: false, name: "Swimming Pool", value: ""), // 0
    Facilities(isSelected: false, name: "Garden", value: ""),
    Facilities(isSelected: false, name: "Pergola", value: ""),
    Facilities(isSelected: false, name: "Sun Deck", value: ""),
    Facilities(isSelected: false, name: "Lawn Tennis Court", value: ""),
    Facilities(isSelected: false, name: "Video Door Security", value: ""), // 5
    Facilities(isSelected: false, name: "Toddler Pool", value: ""),
    Facilities(isSelected: false, name: "Table Tennis", value: ""),
    Facilities(isSelected: false, name: "Basketball Court", value: ""),
    Facilities(isSelected: false, name: "Clinic", value: ""),
    Facilities(isSelected: false, name: "Theater", value: ""), // 10
    Facilities(isSelected: false, name: "Lounge", value: ""),
    Facilities(isSelected: false, name: "Salon", value: ""),
    Facilities(isSelected: false, name: "Aerobics", value: ""),
    Facilities(isSelected: false, name: "Visitors Parking", value: ""),
    Facilities(isSelected: false, name: "Spa", value: ""), // 15
    Facilities(isSelected: false, name: "Creche Day Care", value: ""),
    Facilities(isSelected: false, name: "Barbecue", value: ""),
    Facilities(isSelected: false, name: "Terrace Garden", value: ""),
    Facilities(isSelected: false, name: "Water Softener Plant", value: ""),
    Facilities(isSelected: false, name: "Fountain", value: ""), // 20
    Facilities(isSelected: false, name: "Multipurpose Court", value: ""),
    Facilities(isSelected: false, name: "Amphitheatre", value: ""),
    Facilities(isSelected: false, name: "Business Lounge", value: ""),
    Facilities(isSelected: false, name: "Squash Court", value: ""),
    Facilities(isSelected: false, name: "Cafeteria", value: ""), // 25
    Facilities(isSelected: false, name: "Library", value: ""),
    Facilities(isSelected: false, name: "Cricket Pitch", value: ""),
    Facilities(isSelected: false, name: "Medical Centre", value: ""),
    Facilities(isSelected: false, name: "Card Room", value: ""),
    Facilities(isSelected: false, name: "Restaurant", value: ""), // 30
    Facilities(isSelected: false, name: "Sauna", value: ""),
    Facilities(isSelected: false, name: "Jacuzzi", value: ""),
    Facilities(isSelected: false, name: "Steam Room", value: ""),
    Facilities(isSelected: false, name: "High Speed Elevators", value: ""),
    Facilities(isSelected: false, name: "Football", value: ""), // 35
    Facilities(isSelected: false, name: "Skating Rink", value: ""),
    Facilities(isSelected: false, name: "Grocery Shop", value: ""),
    Facilities(isSelected: false, name: "Wi-Fi", value: ""),
    Facilities(isSelected: false, name: "Banquet Hall", value: ""),
    Facilities(isSelected: false, name: "Party Lawn", value: ""), // 40
    Facilities(isSelected: false, name: "Indoor Games", value: ""),
    Facilities(isSelected: false, name: "CCTV Camera", value: ""),
  ];

  /// Create Project Function
  Future<void> createProjectFunction() async {
    isLoading(true);
    String url = ApiUrl.addBuilderProjectApi;
    log("Create Builder Project Api Url : $url");

    try {
      Map<String, dynamic> apiData = crateProjectData();
      log("apiData : $apiData");

      http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode(apiData),
          headers: apiHeader.sellerHeader);

      log("response : ${response.body}");

      ProjectCreateModel projectCreateModel =
          ProjectCreateModel.fromJson(json.decode(response.body));
      isSuccessStatus = projectCreateModel.status.obs;
      log("projectCreateModel : ${projectCreateModel.data.msg}");

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: projectCreateModel.data.msg);
        Get.back();
      } else {
        log("Create Project Else Else");
      }
    } catch (e) {
      log("Create Project Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Map<String, dynamic> crateProjectData() {
    Map<String, dynamic> data = {
      "name": projectNameController.text.trim().toString(),
      "site_address": projectAddressController.text.trim().toString(),
      "office_address": projectOfficeAddressController.text.trim(),
      "phone": projectPhoneNoController.text.trim().toString(),
      "email": projectEmailController.text.trim().toLowerCase(),
      "project_category_id": "${categoryValue.id}",
      "area_id": "${areaValue.id}",
      "city_id": "${cityValue.id}",
      "swimming_pool": facilitiesList[0].isSelected,
      "garden": facilitiesList[1].isSelected,
      "pergola": facilitiesList[2].isSelected,
      "sun_deck": facilitiesList[3].isSelected,
      "lawn_tennis_court": facilitiesList[4].isSelected,
      "video_door_security": facilitiesList[5].isSelected,
      "toddler_pool": facilitiesList[6].isSelected,
      "table_tennis": facilitiesList[7].isSelected,
      "basketball_court": facilitiesList[8].isSelected,
      "clinic": facilitiesList[9].isSelected,
      "theater": facilitiesList[10].isSelected,
      "lounge": facilitiesList[11].isSelected,
      "salon": facilitiesList[12].isSelected,
      "aerobics": facilitiesList[13].isSelected,
      "visitors_parking": facilitiesList[14].isSelected,
      "spa": facilitiesList[15].isSelected,
      "creche_day_care": facilitiesList[16].isSelected,
      "barbecue": facilitiesList[17].isSelected,
      "terrace_garden": facilitiesList[18].isSelected,
      "water_softener_plant": facilitiesList[19].isSelected,
      "fountain": facilitiesList[20].isSelected,
      "multipurpose_court": facilitiesList[21].isSelected,
      "amphitheatre": facilitiesList[22].isSelected,
      "business_lounge": facilitiesList[23].isSelected,
      "squash_court": facilitiesList[24].isSelected,
      "cafeteria": facilitiesList[25].isSelected,
      "library": facilitiesList[26].isSelected,
      "cricket_pitch": facilitiesList[27].isSelected,
      "medical_centre": facilitiesList[28].isSelected,
      "card_room": facilitiesList[29].isSelected,
      "restaurant": facilitiesList[30].isSelected,
      "sauna": facilitiesList[31].isSelected,
      "jacuzzi": facilitiesList[32].isSelected,
      "steam_room": facilitiesList[33].isSelected,
      "high_speed_elevators": facilitiesList[34].isSelected,
      "football": facilitiesList[35].isSelected,
      "skating_rink": facilitiesList[36].isSelected,
      "grocery_shop": facilitiesList[37].isSelected,
      "wi_fi": facilitiesList[38].isSelected,
      "banquet_hall": facilitiesList[39].isSelected,
      "party_lawn": facilitiesList[40].isSelected,
      "indoor_games": facilitiesList[41].isSelected,
      "cctv": facilitiesList[42].isSelected,
      "why": whyConsiderProjectController.text.trim(),
      "about": moreAboutProjectController.text.trim(),
      "about_builder": aboutBuilderController.text.trim()
    };

    Map<String, dynamic> updateData = {
      "id": updateProjectId,
      "name": projectNameController.text.trim().toString(),
      "site_address": projectAddressController.text.trim().toString(),
      "office_address": projectOfficeAddressController.text.trim(),
      "phone": projectPhoneNoController.text.trim().toString(),
      "email": projectEmailController.text.trim().toLowerCase(),
      "project_category_id": "${categoryValue.id}",
      "area_id": "${areaValue.id}",
      "city_id": "${cityValue.id}",
      "swimming_pool": facilitiesList[0].isSelected,
      "garden": facilitiesList[1].isSelected,
      "pergola": facilitiesList[2].isSelected,
      "sun_deck": facilitiesList[3].isSelected,
      "lawn_tennis_court": facilitiesList[4].isSelected,
      "video_door_security": facilitiesList[5].isSelected,
      "toddler_pool": facilitiesList[6].isSelected,
      "table_tennis": facilitiesList[7].isSelected,
      "basketball_court": facilitiesList[8].isSelected,
      "clinic": facilitiesList[9].isSelected,
      "theater": facilitiesList[10].isSelected,
      "lounge": facilitiesList[11].isSelected,
      "salon": facilitiesList[12].isSelected,
      "aerobics": facilitiesList[13].isSelected,
      "visitors_parking": facilitiesList[14].isSelected,
      "spa": facilitiesList[15].isSelected,
      "creche_day_care": facilitiesList[16].isSelected,
      "barbecue": facilitiesList[17].isSelected,
      "terrace_garden": facilitiesList[18].isSelected,
      "water_softener_plant": facilitiesList[19].isSelected,
      "fountain": facilitiesList[20].isSelected,
      "multipurpose_court": facilitiesList[21].isSelected,
      "amphitheatre": facilitiesList[22].isSelected,
      "business_lounge": facilitiesList[23].isSelected,
      "squash_court": facilitiesList[24].isSelected,
      "cafeteria": facilitiesList[25].isSelected,
      "library": facilitiesList[26].isSelected,
      "cricket_pitch": facilitiesList[27].isSelected,
      "medical_centre": facilitiesList[28].isSelected,
      "card_room": facilitiesList[29].isSelected,
      "restaurant": facilitiesList[30].isSelected,
      "sauna": facilitiesList[31].isSelected,
      "jacuzzi": facilitiesList[32].isSelected,
      "steam_room": facilitiesList[33].isSelected,
      "high_speed_elevators": facilitiesList[34].isSelected,
      "football": facilitiesList[35].isSelected,
      "skating_rink": facilitiesList[36].isSelected,
      "grocery_shop": facilitiesList[37].isSelected,
      "wi_fi": facilitiesList[38].isSelected,
      "banquet_hall": facilitiesList[39].isSelected,
      "party_lawn": facilitiesList[40].isSelected,
      "indoor_games": facilitiesList[41].isSelected,
      "cctv": facilitiesList[42].isSelected,
      "why": whyConsiderProjectController.text.trim(),
      "about": moreAboutProjectController.text.trim(),
      "about_builder": aboutBuilderController.text.trim()
    };

    //todo
    return propertyGenerate == PropertyGenerate.create ? data : updateData;
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
