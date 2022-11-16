import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/home_screen_model/home_screen_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final TextEditingController searchFieldController = TextEditingController();
  List<Banner1> bannerLists = [];
  RxInt activeBannerIndex = 0.obs;
  YoutubePlayerController? youtubePlayerController;
  // String ytUrl = "https://www.youtube.com/watch?v=462shM6Uoeg";
  final newsFeedPageController = PageController();
  RxInt selectedPageIndex = 0.obs;
  List<String> serviceLists = [];
  String youtubeLink = "";
  List<Project> newProjectsList = [];
  List<Project> favouriteProjectsList = [];
  List<Favourite> newListingsList = [];
  List<Favourite> featuredListingsList = [];
    List<CategoryNew> categoryList = [];
  /// DropDown List
  List<HomePropertyType> propertyTypeList = [];
  List<Cities> citiesList = [];

  List<String> aminitiesLists = [
    "Parking Space",
    "Library Area",
    "Swimming Pool",
    "Cafeteria",
    "CCTV",
    "Grocery Shop",
    "Medical Center",
    "Kid's Playland",
  ];




  getHomeScreenDataFunction() async {
    isLoading(true);
    String url = ApiUrl.homeScreenApi;
    log('URL : $url');

    try{
      http.Response response = await http.post(Uri.parse(url));
      log('response: ${response.body}');

      HomeScreenModel homeScreenModel = HomeScreenModel.fromJson(json.decode(response.body));
      isSuccessStatus = homeScreenModel.status.obs;

      if(isSuccessStatus.value) {
        bannerLists = homeScreenModel.data.banner;
        bool ytLinkAvailable = homeScreenModel.data.youtube.isNotEmpty ? true : false;
        if(ytLinkAvailable == true) {
          youtubeLink = homeScreenModel.data.youtube[0].link;
        } else {
          youtubeLink = "";
        }
        runYoutubeVideo(ytLink: youtubeLink);
        newProjectsList = homeScreenModel.data.superProjects;
        favouriteProjectsList = homeScreenModel.data.favouriteProjects;
        newListingsList = homeScreenModel.data.favourite;
        featuredListingsList = homeScreenModel.data.dataSuper;
        propertyTypeList = homeScreenModel.data.type;
        citiesList = homeScreenModel.data.cities;
        categoryList = homeScreenModel.data.categoryNew;
        isLoading(false);
      } else {
        log('getHomeScreenDataFunction Else Else');
      }

    } catch(e) {
      log('getHomeScreenDataFunction Error1 :: $e');
    } /*finally {
      isLoading(false);
    }*/
  }

  @override
  void onInit() {
    getHomeScreenDataFunction();
    super.onInit();
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

  previousClick() {
    newsFeedPageController.previousPage(duration: 1000.milliseconds, curve: Curves.ease);
  }

  forwardClick() {
    newsFeedPageController.nextPage(duration: 1000.milliseconds, curve: Curves.ease);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }


}