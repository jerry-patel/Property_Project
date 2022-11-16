import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../controllers/project_details_screen_controller/project_details_screen_controller.dart';
import 'package:flutter_html/flutter_html.dart';

/// Images Slider Module
class ImagesSliderModule extends StatelessWidget {
  ImagesSliderModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.imagesList.length,
      itemBuilder: (context, index, realIndex) {
        return bannerListTile(index);
      },
      options: CarouselOptions(
          height: Get.height * 0.25,
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 3),
          onPageChanged: (index, reason) {
            screenController.activeBannerIndex.value = index;
          }),
    );
  }

  Widget bannerListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(screenController.imagesList[index].img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}

/// Slider Indicator
class ImagesSliderIndicatorModule extends StatelessWidget {
  ImagesSliderIndicatorModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.imagesList.length,
              (index) => Container(
            margin: const EdgeInsets.all(4),
            width: screenController.activeBannerIndex.value == index ? 14 : 11,
            height: screenController.activeBannerIndex.value == index ? 14 : 11,
            decoration: BoxDecoration(
              color: screenController.activeBannerIndex.value == index
                  ? AppColors.greenColor
                  : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

/// Property Name & Location
class PropertyTitleAndAreaModule extends StatelessWidget {
  PropertyTitleAndAreaModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          screenController.propertyTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.greenColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "${screenController.propertyArea}, ${screenController.propertyCity}",
        ),
      ],
    );
  }
}

/// Price Details
class PriceDetailsModule extends StatelessWidget {
  PriceDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Price Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          itemCount: screenController.priceList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              screenController.priceList[i].type,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),

                            Text(
                              "${screenController.priceList[i].area} (sq. ft.)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),

                          ],
                        ),
                      ),



                      Expanded(
                        flex: 5,
                        child: Text(
                          "₹${screenController.priceList[i].price}",
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Aminities
class AminitiesModule extends StatelessWidget {
  AminitiesModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Aminities",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          itemCount: screenController.aminitiesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return _aminitiesTile(screenController.aminitiesList[i]);
          },
        ),
      ],
    );
  }

  Widget _aminitiesTile(String aminitiesName) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greenColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          aminitiesName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

}

/// Why Question
class WhyQuestionModule extends StatelessWidget {
  WhyQuestionModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Why Consider Project?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Html(data: screenController.whyAnswer),
        // Text(
        //   screenController.whyAnswer,
        //   maxLines: 3,
        //   overflow: TextOverflow.ellipsis,
        // ),
      ],
    );
  }
}

/// Near By Area
class NearByTextModule extends StatelessWidget {
  NearByTextModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Near By",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          screenController.nearBy,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Video Module
class VideoGalleryModule extends StatelessWidget {
  VideoGalleryModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.videoAvailable == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Video Gallery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 180,
                color: Colors.grey,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: screenController.youtubePlayerController!,
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) {
                    return SizedBox(
                      height: 180,
                      child: player,
                    );
                  },
                ),
              )
            ],
          )
        : Container();
  }
}

/// Brochures Module
class BrochuresModule extends StatelessWidget {
  BrochuresModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Brochures",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () async => await screenController.showBrochure(screenController.brochureUrl),
          child: const Text(
            "Show",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}


