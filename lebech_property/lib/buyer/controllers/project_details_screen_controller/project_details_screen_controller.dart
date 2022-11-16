import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/buyer/models/project_details_model/project_details_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectDetailsScreenController extends GetxController {
  int projectId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt activeBannerIndex = 0.obs;
  List<Image> imagesList = [];
  List<Price> priceList = [];
  String propertyTitle = "";
  String propertyArea = "";
  String propertyCity = "";
  List<String> aminitiesList = [];
  String whyAnswer = "";
  String nearBy = "";
  String brochureUrl = "";
  YoutubePlayerController? youtubePlayerController;
  String youtubeLink = "";
  bool videoAvailable = false;


  /// Get Project Details Using Id
  getProjectDetailsFunction() async {
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
          videoAvailable = projectDetailsModel.data.data.videos.isEmpty ? false : true;
          youtubeLink = videoAvailable == true ? projectDetailsModel.data.data.videos[0].link : "";
          log("youtubeLink :: $youtubeLink");
          runYoutubeVideo(ytLink: youtubeLink);
          
          imagesList.clear();
          priceList.clear();
          imagesList.addAll(projectDetailsModel.data.data.images);
          priceList.addAll(projectDetailsModel.data.data.prices);
          propertyTitle = projectDetailsModel.data.data.name;
          propertyArea = projectDetailsModel.data.data.area.name;
          propertyCity = projectDetailsModel.data.data.city.name;
          /// Add "True" value in Aminities List
          addAminities(singleItemData: projectDetailsModel.data.data);
          whyAnswer = projectDetailsModel.data.data.why;
          nearBy = projectDetailsModel.data.data.nearBy.isNotEmpty
          ? projectDetailsModel.data.data.nearBy[0].name : "";
          brochureUrl = projectDetailsModel.data.data.brochures.isNotEmpty
          ? projectDetailsModel.data.data.brochures[0].file : "";

          isLoading(false);
        } else {
          log("getProjectListFunction Else Else");
        }

      });

    } catch(e) {
      log("getProjectDetailsFunction Error :: $e");
    } /*finally{
      isLoading(false);
    }*/
  }

  @override
  void onInit() {
    log("projectId : $projectId");
    getProjectDetailsFunction();
    super.onInit();
  }


  showBrochure(brochureUrl) async {
    String url = '$brochureUrl';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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

  /// Only "True" Aminities add in List
  addAminities({required DataData singleItemData}) {
    if(singleItemData.swimmingPool == "true") {
      aminitiesList.add("Swimming Pool");
    } if(singleItemData.garden == "true") {
      aminitiesList.add("Garden");
    } if (singleItemData.pergola == "true") {
      aminitiesList.add("Pergola");
    } if (singleItemData.sunDeck == "true") {
      aminitiesList.add("Sun Deck");
    } if(singleItemData.lawnTennisCourt == "true") {
      aminitiesList.add("Lawn Tennis Court");
    } if(singleItemData.videoDoorSecurity == "true") {
      aminitiesList.add("Video Door Security");
    } if(singleItemData.toddlerPool == "true") {
      aminitiesList.add("Toddler Pool");
    } if(singleItemData.tableTennis == "true") {
      aminitiesList.add("Table Tennis");
    } if(singleItemData.basketballCourt == "true") {
      aminitiesList.add("BasketBall Court");
    } if(singleItemData.clinic == "true") {
      aminitiesList.add("Clinic");
    } if(singleItemData.theater == "true") {
      aminitiesList.add("Theater");
    } if(singleItemData.lounge == "true") {
      aminitiesList.add("Lounge");
    } if(singleItemData.salon == "true") {
      aminitiesList.add("Saloon");
    } if(singleItemData.aerobics == "true") {
      aminitiesList.add("Aerobics");
    } if(singleItemData.visitorsParking == "true") {
      aminitiesList.add("Visitors Parking");
    } if(singleItemData.spa == "true") {
      aminitiesList.add("Spa");
    } if(singleItemData.crecheDayCare == "true") {
      aminitiesList.add("Creche Day Care");
    } if(singleItemData.barbecue == "true") {
      aminitiesList.add("Barbecue");
    } if(singleItemData.terraceGarden == "true") {
      aminitiesList.add("Terrace Garden");
    } if(singleItemData.waterSoftenerPlant == "true") {
      aminitiesList.add("Water Softener Plant");
    } if(singleItemData.fountain == "true") {
      aminitiesList.add("Fountain");
    } if(singleItemData.multipurposeCourt == "true") {
      aminitiesList.add("Multi Purpose Court");
    } if(singleItemData.amphitheatre == "true") {
      aminitiesList.add("Amphitheatre");
    } if(singleItemData.businessLounge == "true") {
      aminitiesList.add("Business Lounge");
    } if(singleItemData.squashCourt == "true") {
      aminitiesList.add("SquashCourt");
    } if(singleItemData.cafeteria == "true") {
      aminitiesList.add("Cafeteria");
    } if(singleItemData.dataLibrary == "true") {
      aminitiesList.add("Library");
    } if(singleItemData.cricketPitch == "true") {
      aminitiesList.add("Cricket Pitch");
    } if(singleItemData.medicalCentre == "true") {
      aminitiesList.add("Medical Centre");
    } if(singleItemData.cardRoom == "true") {
      aminitiesList.add("Card Room");
    } if(singleItemData.restaurant == "true") {
      aminitiesList.add("Restaurant");
    } if(singleItemData.sauna == "true") {
      aminitiesList.add("Sauna");
    } if(singleItemData.jacuzzi == "true") {
      aminitiesList.add("Jacuzzi");
    } if(singleItemData.steamRoom == "true") {
      aminitiesList.add("Stream Room");
    } if(singleItemData.highSpeedElevators == "true") {
      aminitiesList.add("High Speed Elevators");
    } if(singleItemData.football == "true") {
      aminitiesList.add("FootBall");
    } if(singleItemData.skatingRink == "true") {
      aminitiesList.add("SkatingRink");
    } if(singleItemData.groceryShop == "true") {
      aminitiesList.add("GroceryShop");
    } if(singleItemData.wiFi == "true") {
      aminitiesList.add("WiFi");
    } if(singleItemData.banquetHall == "true") {
      aminitiesList.add("BanquetHall");
    } if(singleItemData.partyLawn == "true") {
      aminitiesList.add("PartyLawn");
    } if(singleItemData.indoorGames == "true") {
      aminitiesList.add("IndoorGames");
    } if(singleItemData.cctv == "true") {
      aminitiesList.add("CCTV");
    }
  }

}