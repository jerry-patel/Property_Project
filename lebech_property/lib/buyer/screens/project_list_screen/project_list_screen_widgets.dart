import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/screens/project_details_screen/project_details_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/project_list_screen_controller/project_list_screen_controller.dart';
import '../../models/project_list_model/project_list_model.dart';



class PropertyListModule extends StatelessWidget {
  PropertyListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.projectLists.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        Datum singleItem = screenController.projectLists[i];
        return _listItemModule(singleItem);
      },
    );
  }

  Widget _listItemModule(Datum singleItem) {
    return GestureDetector(
      onTap: () {
        log("id : ${singleItem.id}");
        Get.to(
          () => ProjectDetailsScreen(),
          transition: Transition.rightToLeft,
          arguments: singleItem.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greenColor),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 35,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.banner1Img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            singleItem.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 5),

                          Text(
                            singleItem.area.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),

                          /*SizedBox(
                            height: 17,
                            child: ListView.builder(
                              itemCount: singleItem.prices.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Text(
                                        singleNewProjectItem.prices[i].type,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      const VerticalDivider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),*/

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 40,
                  child: SocialMediaIconsModule(),
                ),

                // const SizedBox(height: 10),
                /*Row(
                  children: [

                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.greenColor, width: 2),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 11),
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.greenColor, fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),

                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.greenColor, width: 2),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 11),
                          child: Text(
                            'Get Phone No.',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.greenColor, fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),

                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.greenColor,
                          border: Border.all(color: AppColors.greenColor, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.call, color: Colors.white, size: 18),
                              SizedBox(width: 3),
                              Text(
                                'Call Owner',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
            /*Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Property Added In Wishlist!");
                },
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: AppColors.greenColor,
                ),
              ),
            ),*/
          ],
        ).commonAllSidePadding(padding: 5),
      ).commonSymmetricPadding(vertical: 8),
    );
  }

}
