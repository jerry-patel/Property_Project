import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';
import 'package:lebech_property/seller/models/seller_home_screen_models/property_list_model.dart';
import 'package:lebech_property/seller/screens/add_property_image_screen/add_property_image_screen.dart';
import 'package:lebech_property/seller/screens/add_property_video_screen/add_property_video_screen.dart';
import 'package:lebech_property/seller/screens/seller_create_property_screen/seller_create_property_screen.dart';
import 'package:lebech_property/seller/screens/seller_property_yt_link_screen/seller_property_yt_link_screen.dart';

class SellerPropertyListModule extends StatelessWidget {
  SellerPropertyListModule({Key? key}) : super(key: key);
  final sellerHomeScreenController = Get.find<SellerHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sellerHomeScreenController.sellerPropertyList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        SellerPropertyDatum propertySingleItem = sellerHomeScreenController.sellerPropertyList[i];
        return _sellerPropertyListTile(propertySingleItem);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _sellerPropertyListTile(SellerPropertyDatum propertySingleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blueColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  propertySingleItem.createdAt,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if(propertySingleItem.status == "true") {
                      await sellerHomeScreenController
                          .changePropertyStatus(propertySingleItem.id, false);
                    } else {
                      await sellerHomeScreenController
                          .changePropertyStatus(propertySingleItem.id, true);
                    }
                  },
                  child: Text(
                    propertySingleItem.status == "true"
                        ? "Deactivate"
                        : "Activate",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  // width: Get.width * 0.35,
                  height: Get.width * 0.35,
                  child: propertySingleItem.propertyImages.isEmpty
                  ? Image.asset(AppImages.banner1Img, fit: BoxFit.cover,)
                  : Image.network(
                    propertySingleItem.propertyImages[0].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertySingleItem.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      propertySingleItem.city.name,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),
                    Text(
                      propertySingleItem.detail,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "${propertySingleItem.rent.rent} ₹",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Basic Detail  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(()=>
                              SellerCreatePropertyScreen(),
                            arguments: [
                              PropertyGenerate.create,
                              propertySingleItem.id
                            ],
                            transition: Transition.leftToRight,
                          );
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Images  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                                  ()=> AddPropertyImageScreen(),
                              transition: Transition.zoom,
                            arguments: [propertySingleItem.id, propertySingleItem.title],
                          )!.then((value) async {
                            await sellerHomeScreenController.getSellerAllPropertyFunction();
                          });
                          },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Property Video  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                                ()=> AddSellerPropertyVideoScreen(),
                            transition: Transition.zoom,
                            arguments: [propertySingleItem.id, propertySingleItem.title],
                          )!.then((value) async {
                            await sellerHomeScreenController.getSellerAllPropertyFunction();
                          });
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Youtube Link  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                                ()=> SellerPropertyYoutubeLinkScreen(),
                            transition: Transition.zoom,
                            arguments: [propertySingleItem.id, propertySingleItem.title],
                          )!.then((value) async {
                            await sellerHomeScreenController.getSellerAllPropertyFunction();
                          });
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ).commonAllSidePadding(padding: 10),
    ).commonSymmetricPadding(vertical: 8);
  }

}
