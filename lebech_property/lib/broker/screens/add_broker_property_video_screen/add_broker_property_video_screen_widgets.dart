import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/broker/controllers/add_broker_property_video_screen_controller/add_broker_property_video_screen_controller.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';


class BrokerPropertyVideoUploadModule extends StatelessWidget {
  BrokerPropertyVideoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBrokerPropertyVideoScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Property Video",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await selectImage();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: const Text(
                    "Choose File"
                ).commonAllSidePadding(padding: 15),
              ),
            ),
            const SizedBox(width: 8),

            Expanded(
              child: screenController.projectVideo.path.isNotEmpty
                  ? Text(screenController.projectVideo.path)
                  : const Text("No file Chosen"),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                if(screenController.projectVideo.path.isEmpty) {
                  Fluttertoast.showToast(msg: "Please select property video");
                } else {
                  await screenController.uploadPropertyVideoFunction();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(),
                  color: AppColors.blueColor,
                ),
                child: const Text(
                  "Upload",
                  style: TextStyle(color: Colors.white),
                ).commonAllSidePadding(padding: 15),
              ),
            ),
          ],
        ),

      ],
    ).commonAllSidePadding(padding: 10);
  }


  selectImage() async {
    screenController.isLoading(true);
    try {
      final XFile? selectedVideo = await imagePicker.pickVideo(source: ImageSource.gallery);
      screenController.projectVideo = selectedVideo!;
    } catch(e) {
      log("Select Property Video Error : $e");
    }
    screenController.isLoading(false);
  }

}


class BrokerPropertyVideoShowModule extends StatelessWidget {
  BrokerPropertyVideoShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBrokerPropertyVideoScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.chewieController != null &&
        screenController.videoPlayerController != null &&
        screenController.propertyApiVideo != ""
        ? Container(
      height: 180,
      color: Colors.grey,
      child: Chewie(controller: screenController.chewieController!),
    ).commonAllSidePadding(padding: 10)
        : const Center(
      child: Text(
        "No Project Video Available!",
      ),
    );
  }
}

