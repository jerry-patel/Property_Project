import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/property_details_model/fact_and_feature_local_model.dart';
import 'package:lebech_property/buyer/models/property_details_model/fact_number_list_local_model.dart';
import 'package:lebech_property/buyer/models/property_details_model/property_details_model.dart';
import 'package:lebech_property/buyer/models/property_details_model/property_list_local_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PropertyDetailsScreenController extends GetxController {
  String propertyId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt activeBannerIndex = 0.obs;
  RxList<PropertyImage> propertyBannerLists = RxList();
  String propertyName = "";
  List<String> aminitiesList = [];
  List<PropertyDetailNameModule> propertyDetailsList = [];
  List<FactNumberListLocalModel> factNumberList = [];
  List<FactAndFeatureModel> factAndFeatureList = [];

  YoutubePlayerController? youtubePlayerController;
  String youtubeLink = "";
  bool videoAvailable = false;


  Future<void> getPropertyDetailsDataFunction() async {
    isLoading(true);
    String url = ApiUrl.propertyDetailsApi;
    log("Url : $url");
    log("Property Id : $propertyId");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields["id"] = propertyId;

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((value) async {
        PropertyDetailsModel propertyDetailsModel =
            PropertyDetailsModel.fromJson(json.decode(value));
        isSuccessStatus = propertyDetailsModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {

          videoAvailable = propertyDetailsModel.data.data.videos.isEmpty ? false : true;
          if(videoAvailable == true) {
            youtubeLink = propertyDetailsModel.data.data.videos[0].link;
          } else {
            youtubeLink = "";
          }
          // youtubeLink = propertyDetailsModel.data.data.videos == []
          // ? "" : propertyDetailsModel.data.data.videos[0].link;
          runYoutubeVideo(ytLink: youtubeLink);


          propertyBannerLists.clear();
          /// Property Images List Add for Slider
          if(propertyDetailsModel.data.data.propertyImages.isNotEmpty) {
              propertyBannerLists.addAll(propertyDetailsModel.data.data.propertyImages);
          }
          log("propertyBannerLists Length : ${propertyBannerLists.length}");
          propertyName = propertyDetailsModel.data.data.title;

          addAminities(singleItemData: propertyDetailsModel.data.data);
          addPropertyDetails(singleItemData: propertyDetailsModel.data.data);
          addFactNumberList(singleItemData: propertyDetailsModel.data.data);
          addFactAndFeature(singleItemData: propertyDetailsModel.data.data);


          isLoading(true);
          isLoading(false);

        } else {
          log("getPropertyDetailsDataFunction Else Else");
        }
      });
    } catch (e) {
      log("getPropertyDetailsDataFunction Error : $e");
    } /*finally {
      isLoading(false);
    }*/
  }

  @override
  void onInit() {
    getPropertyDetailsDataFunction();
    super.onInit();
  }

  addAminities({required DataData singleItemData}) {
    if (singleItemData.propertyTenant.poojaRoom == "true") {
      aminitiesList.add("Pooja Room");
    }
    if (singleItemData.propertyTenant.study == "true") {
      aminitiesList.add("Study");
    }
    if (singleItemData.propertyTenant.store == "true") {
      aminitiesList.add("Store Room");
    }
    if (singleItemData.propertyTenant.servantRoom == "true") {
      aminitiesList.add("Servant Room");
    }
    if (singleItemData.propertyTenant.garden == "true") {
      aminitiesList.add("Garden");
    }
    if (singleItemData.propertyTenant.pool == "true") {
      aminitiesList.add("Pool");
    }
    if (singleItemData.propertyTenant.mainRoad == "true") {
      aminitiesList.add("Main Road");
    }
    if (singleItemData.propertyTenant.ceramicTiles == "true") {
      aminitiesList.add("Ceramic Tiles");
    }
    if (singleItemData.propertyTenant.granite == "true") {
      aminitiesList.add("Granite");
    }
    if (singleItemData.propertyTenant.marble == "true") {
      aminitiesList.add("Marble");
    }
    if (singleItemData.propertyTenant.marbonite == "true") {
      aminitiesList.add("Marbonite");
    }
    if (singleItemData.propertyTenant.mosaic == "true") {
      aminitiesList.add("Mosaic");
    }
    if (singleItemData.propertyTenant.normal == "true") {
      aminitiesList.add("Normal");
    }
    if (singleItemData.propertyTenant.vitrified == "true") {
      aminitiesList.add("Vitrified");
    }
    if (singleItemData.propertyTenant.wooden == "true") {
      aminitiesList.add("Wooden");
    }
    if (singleItemData.propertyTenant.gym == "true") {
      aminitiesList.add("Gym");
    }
    if (singleItemData.propertyTenant.jogging == "true") {
      aminitiesList.add("Jogging");
    }
    if (singleItemData.propertyTenant.liftAvailable == "true") {
      aminitiesList.add("Lift Available");
    }
    if (singleItemData.propertyTenant.lift == "true") {
      aminitiesList.add("Lift");
    }
    if (singleItemData.propertyTenant.pipeGas == "true") {
      aminitiesList.add("Pipe Gas");
    }
    if (singleItemData.propertyTenant.powerBackup == "true") {
      aminitiesList.add("Power Backup");
    }
    if (singleItemData.propertyTenant.reservedParking == "true") {
      aminitiesList.add("Reserved Parking");
    }
    if (singleItemData.propertyTenant.security == "true") {
      aminitiesList.add("Security");
    }
    if (singleItemData.propertyTenant.swimmingPool == "true") {
      aminitiesList.add("Swimming Pool");
    }
    if(singleItemData.boundry == "true") {
      aminitiesList.add("Boundry");
    }
    if(singleItemData.openBoundry == "true") {
      aminitiesList.add("Open Boundry");
    }
    if(singleItemData.mainGate == "true") {
      aminitiesList.add("Main Gate");
    }
    if(singleItemData.securityCabin == "true") {
      aminitiesList.add("Security Cabin");
    }
    if(singleItemData.fridge == "true") {
      aminitiesList.add("Fridge");
    }
    if(singleItemData.sofa == "true") {
      aminitiesList.add("Sofa");
    }
    if(singleItemData.washingMachine == "true") {
      aminitiesList.add("Washing machine");
    }
    if(singleItemData.diningTable == "true") {
      aminitiesList.add("Dining Table");
    }
    if(singleItemData.microwave == "true") {
      aminitiesList.add("Microwave");
    }
    if(singleItemData.gas == "true") {
      aminitiesList.add("Gas");
    }
    if(singleItemData.personalWashRoom == "true") {
      aminitiesList.add("Personal Washroom");
    }
    if(singleItemData.personalKeychain == "true") {
      aminitiesList.add("Personal Keychain");
    }
    if(singleItemData.cabin == "true") {
      aminitiesList.add("Cabin");
    }
    if(singleItemData.personalLift == "true") {
      aminitiesList.add("Personal Lift");
    }

  }

  addPropertyDetails({required DataData singleItemData}) {
    if (singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Furnished", propertyValue: singleItemData.furnished),
      );
    }

    if(singleItemData.propertyTenant.nonVegetarians != "no") {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Non Vegetarians",
            propertyValue: singleItemData.propertyTenant.nonVegetarians),
      );
    }

    // if(singleItemData.propertyType.id == 1 ||
    //     singleItemData.propertyType.id == 2 ||
    //     singleItemData.propertyType.id == 4 ||
    //     singleItemData.propertyType.id == 5 ||
    //     singleItemData.propertyType.id == 6 ||
    //     singleItemData.propertyType.id == 7) {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Facing",
            propertyValue: singleItemData.propertyTenant.facing),
      );
    // }


    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Water",
          propertyValue: "${singleItemData.propertyTenant.water} Hour"),
    );

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.age != "0") {
        propertyDetailsList.add(
          PropertyDetailNameModule(
              propertyName: "Age",
              propertyValue: singleItemData.age),
        );
      }
    }

    if(singleItemData.propertyTenant.bachelors != "no") {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Bachelors",
            propertyValue: singleItemData.propertyTenant.bachelors),
      );
    }

    if(singleItemData.propertyTenant.pets != "no") {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Pets",
            propertyValue: singleItemData.propertyTenant.pets),
      );
    }

    // if(singleItemData.propertyTenant.totalCarParking != 0) {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Total Car Parking",
            propertyValue: singleItemData.propertyTenant.totalCarParking
                .toString()),
      );
    // }

    // if(singleItemData.propertyTenant.coveredCarParking != 0) {
      propertyDetailsList.add(
        PropertyDetailNameModule(
            propertyName: "Covered Car Parking",
            propertyValue: singleItemData.propertyTenant.coveredCarParking
                .toString()),
      );
    // }

    // if(singleItemData.propertyTenant.openCarParking != 0) {
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Open Car Parking",
          propertyValue: singleItemData.propertyTenant.openCarParking
              .toString()),
    );
    // }

    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Electricity",
          propertyValue: "${singleItemData.propertyTenant.electricity} Hour"),
    );

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.floorNumber != "0") {
        propertyDetailsList.add(
          PropertyDetailNameModule(
              propertyName: "Floor Number",
              propertyValue: singleItemData.floorNumber),
        );
      }
    }

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.totalFloor != "0") {
        propertyDetailsList.add(
          PropertyDetailNameModule(
              propertyName: "Total Floor",
              propertyValue: singleItemData.totalFloor),
        );
      }
    }

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.flatFloor != "0") {
        propertyDetailsList.add(
          PropertyDetailNameModule(
              propertyName: "Unit On Floor",
              propertyValue: singleItemData.flatFloor),
        );
      }
    }

  }

  addFactNumberList({required DataData singleItemData}) {

    if(singleItemData.carpetArea != "0") {
      if(singleItemData.propertyType.id == 11
          || singleItemData.propertyType.id == 8) {
        factNumberList.add(
            FactNumberListLocalModel(
                factName: "Var/Vigha/Yard",
                factValue: singleItemData.yard)
        );
      } else {
        factNumberList.add(
            FactNumberListLocalModel(
                factName: "Carpet Area",
                factValue: singleItemData.carpetArea)
        );
      }
    }

    if (singleItemData.superArea != "0") {
      if (singleItemData.propertyType.id == 1 ||
          singleItemData.propertyType.id == 2 ||
          singleItemData.propertyType.id == 4 ||
          singleItemData.propertyType.id == 5 ||
          singleItemData.propertyType.id == 7 ||
          singleItemData.propertyType.id == 10 ||
          singleItemData.propertyType.id == 9 ||
          singleItemData.propertyType.id == 3) {
        factNumberList.add(FactNumberListLocalModel(
            factName: "Super Area", factValue: singleItemData.superArea));
      }
    }

    if (singleItemData.age != "0") {
      if (singleItemData.propertyType.id == 1 ||
          singleItemData.propertyType.id == 2 ||
          singleItemData.propertyType.id == 4 ||
          singleItemData.propertyType.id == 5 ||
          singleItemData.propertyType.id == 7 ||
          singleItemData.propertyType.id == 3 ||
          singleItemData.propertyType.id == 9 ||
          singleItemData.propertyType.id == 12 ||
          singleItemData.propertyType.id == 10) {
        factNumberList.add(FactNumberListLocalModel(
            factName: "Construction Age",
            factValue: "${singleItemData.age} Year"));
      }
    }

    if(singleItemData.rent.rent != 0) {
      if (singleItemData.detail == "sale") {
        factNumberList.add(
            FactNumberListLocalModel(
                factName: "Sale Price",
                factValue: "${singleItemData.rent.rent.toString()}₹")
        );
      }
    }

    if(singleItemData.securityDeposite != "") {
      factNumberList.add(
          FactNumberListLocalModel(
              factName: "Security Deposite",
              factValue: singleItemData.securityDeposite)
      );
    }

    if (singleItemData.detail != "sale") {
      factNumberList.add(
          FactNumberListLocalModel(
              factName: "Rent",
              factValue: singleItemData.securityDeposite.toString())
      );
    }

    if (singleItemData.detail != "sale") {
      factNumberList.add(
          FactNumberListLocalModel(
              factName: "Maintenance",
              factValue: "${singleItemData.maintenance.toString()}/${singleItemData.maintenanceTenure.toString()}")
      );
    }

    if (singleItemData.detail != "sale") {
      factNumberList.add(
          FactNumberListLocalModel(
              factName: "Maintenance Tenure",
              factValue: singleItemData.maintenanceTenure.toString())
      );
    }

    if (singleItemData.detail != "sale") {
      factNumberList.add(
          FactNumberListLocalModel(
              factName: "Property Tax Payable By",
              factValue: singleItemData.propertyTax.toString())
      );
    }


  }

  addFactAndFeature({required DataData singleItemData}) {
    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ) {
      if (singleItemData.bedrooms != "0") {
        factAndFeatureList.add(
          FactAndFeatureModel(
              name: "Bedroom",
              value: singleItemData.bedrooms),
        );
      }
    }

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7) {
      if (singleItemData.balconies != "0") {
        factAndFeatureList.add(
          FactAndFeatureModel(
              name: "Balconies",
              value: singleItemData.balconies),
        );
      }
    }

    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.bathrooms != "0") {
        factAndFeatureList.add(
          FactAndFeatureModel(
              name: "Bathroom",
              value: singleItemData.bathrooms),
        );
      }
    }
    if(singleItemData.propertyType.id == 1 ||
        singleItemData.propertyType.id == 2 ||
        singleItemData.propertyType.id == 4 ||
        singleItemData.propertyType.id == 5 ||
        singleItemData.propertyType.id == 6 ||
        singleItemData.propertyType.id == 7 ||
        singleItemData.propertyType.id == 10 ||
        singleItemData.propertyType.id == 9 ||
        singleItemData.propertyType.id == 3) {
      if (singleItemData.lift != "0") {
        factAndFeatureList.add(
          FactAndFeatureModel(
              name: "Lift",
              value: singleItemData.lift),
        );
      }
    }
  }

  /// Get Youtube Video URL
  void runYoutubeVideo({required String ytLink}) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: "${YoutubePlayer.convertUrlToId(ytLink)}",
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

}
