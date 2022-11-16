import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/broker/controllers/broker_property_yt_link_screen_controller/broker_property_yt_link_screen_controller.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/get_property_video_link_model.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';

class BrokerPropertyVideoUploadModule extends StatelessWidget {
  BrokerPropertyVideoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrokerPropertyYoutubeLinkScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Property Youtube Link",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),

        TextFormField(
          controller: screenController.ytLinkController,
          keyboardType: TextInputType.text,
          decoration: commonFieldDecoration(hintText: 'Project Youtube Link'),
          validator: (value) => FieldValidations().validateYoutubeLink(value!),
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                await screenController.uploadYoutubeLinkFunction();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(),
                  color: AppColors.blueColor,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ).commonAllSidePadding(padding: 15),
              ),
            ),
          ],
        ),

      ],
    );
  }
}



class BrokerPropertyVideoLinkListModule extends StatelessWidget {
  BrokerPropertyVideoLinkListModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrokerPropertyYoutubeLinkScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.propertyYtLinkList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        YtLinkDatum singleItem = screenController.propertyYtLinkList[i];
        return _ytLinkListTile(singleItem);
      },
    );
  }

  Widget _ytLinkListTile(YtLinkDatum singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Row(
        children: [
          Expanded(child: Text(singleItem.link)),

          IconButton(
            onPressed: () async {
              await screenController.deletePropertyYoutubeLinkFunction(
                  id: singleItem.id
              );
            },
            icon: const Icon(Icons.delete_rounded,
              color: Colors.red,
            ),
          ),

        ],
      ).commonAllSidePadding(padding: 5),
    ).commonAllSidePadding(padding: 5);
  }

}

