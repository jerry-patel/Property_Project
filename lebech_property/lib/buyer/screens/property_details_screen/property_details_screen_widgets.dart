import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/property_details_model/fact_and_feature_local_model.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/constants/text_styles.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../controllers/property_details_screen_controller/property_details_screen_controller.dart';

/// Property Images Slider
class PropertyImageSliderModule extends StatelessWidget {
  PropertyImageSliderModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => screenController.propertyBannerLists.isEmpty
      ? Container(
            height: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
              ),
              image: DecorationImage(
                image: AssetImage(AppImages.banner1Img),
                fit: BoxFit.cover,
              ),
            ),
          )
          : Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: screenController.propertyBannerLists.length,
            itemBuilder: (context, index, realIndex) {
              return propertyBannerListTile(index);
            },
            options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  screenController.activeBannerIndex.value = index;
                }),
          ),

          // SizedBox(
          //   height: 50,
          //   child: Expanded(
          //     child: propertyBannerIndicatorModule(),
          //   ),
          // ),
        ],
      ).commonAllSidePadding(padding: 10),
    );
  }

  Widget propertyBannerListTile(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(screenController.propertyBannerLists[index].image),
          fit: BoxFit.cover,
        ),
      ),
    ).commonSymmetricPadding(horizontal: 8);
  }

  Widget propertyBannerIndicatorModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          screenController.propertyBannerLists.length,
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
          )),
    );
  }

}

/// Property Name
class PropertyNameModule extends StatelessWidget {
  PropertyNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return HeadingModule(heading: screenController.propertyName);
  }
}


/// Property Details
class PropertyDetailsModule extends StatelessWidget {
  const PropertyDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingModule(heading: 'Property Detail'),
        const SizedBox(height: 10),
        DetailsModule(),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

}

class DetailsModule extends StatelessWidget {
  DetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.propertyDetailsList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return _singleDetailsModule(
          heading: screenController.propertyDetailsList[i].propertyName,
          value: screenController.propertyDetailsList[i].propertyValue,
        );
      },

    ).commonSymmetricPadding(horizontal: 10);
  }

  _singleDetailsModule({required String heading, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            heading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: detailsHeadingStyle(),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value.toUpperCase(),
          textAlign: TextAlign.end,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: detailsHeadingStyle(),
        ),
      ],
    );
  }

}


/// Aminities
class AminitiesModule extends StatelessWidget {
  AminitiesModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

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
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _aminitiesTile(String aminitiesName) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
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

/// Fact Numbers
class FactNumbersModule extends StatelessWidget {
  FactNumbersModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingModule(heading: 'Fact Numbers'),
        const SizedBox(height: 10),
        _detailsModule(),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _detailsModule() {
    return ListView.builder(
      itemCount: screenController.factNumberList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return _singleDetailsModule(
          heading: screenController.factNumberList[i].factName,
          value: screenController.factNumberList[i].factValue,
        );
      },

    );
  }

  _singleDetailsModule({required String heading, required String value}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              heading,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: detailsHeadingStyle(),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value.toUpperCase(),
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: detailsHeadingStyle(),
          ),

        ],
      ),
    );
  }

}

/// Fact & Features
class FactsAndFeaturesModule extends StatelessWidget {
  FactsAndFeaturesModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingModule(heading: 'Facts and Features'),
        const SizedBox(height: 10),
        GridView.builder(
          itemCount: screenController.factAndFeatureList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            return _factsAndFeaturesGridTile(screenController.factAndFeatureList[i]);
          },
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _factsAndFeaturesGridTile(FactAndFeatureModel singleItem) {
    return Container(
      padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.grey.shade200,
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  singleItem.name,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  singleItem.value,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/// Video Module
class PropertyDetailsVideoGalleryModule extends StatelessWidget {
  PropertyDetailsVideoGalleryModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return /*screenController.videoAvailable == true
        ?*/ Column(
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
    ).commonSymmetricPadding(horizontal: 8)
        /*: Container()*/;
  }
}
