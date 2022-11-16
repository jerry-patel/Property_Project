import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/visit_list_screen_controller/visit_list_screen_controller.dart';
import '../../models/visit_list_screen_model/visit_list_model.dart';

class VisitListScreen extends StatelessWidget {
  VisitListScreen({Key? key}) : super(key: key);
  final visitListScreenController = Get.put(VisitListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Visits"),
      body: Obx(
        () => visitListScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : ListView.builder(
                itemCount: visitListScreenController.visitList.length,
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  VisitDatum singleItem =
                      visitListScreenController.visitList[i];
                  return _visitListTile(singleItem);
                },
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }

  Widget _visitListTile(VisitDatum singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image:
                            NetworkImage(singleItem.image[0].image.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    singleItem.property,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 22,
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Branch",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(singleItem.branch),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 22,
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Time Slot",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(singleItem.time),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 22,
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Status",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(singleItem.status),
                ),
              ],
            ),
          ),
        ],
      ).commonAllSidePadding(padding: 10),
    ).commonSymmetricPadding(vertical: 8);
  }
}
