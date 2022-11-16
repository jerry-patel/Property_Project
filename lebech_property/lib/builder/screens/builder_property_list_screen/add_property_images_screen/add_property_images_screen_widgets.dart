import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/controllers/add_property_images_screen_controller/add_property_images_screen_controller.dart';
import 'package:lebech_property/builder/models/project_yt_link_screen_model/project_yt_link_model.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';

/// Builder Property Images Module (Upload & Show)
class BuilderPropertyImageUploadModule extends StatelessWidget {
  BuilderPropertyImageUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Images",
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
                await selectImages();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child:
                    const Text("Choose File").commonAllSidePadding(padding: 15),
              ),
            ),
            const SizedBox(width: 8),
            screenController.imageFileList.isNotEmpty
                ? Text(
                    "${screenController.imageFileList.length} files selected")
                : const Text("No file Chosen"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                await screenController.addPropertyImagesFunction();
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

  // Select Multiple Images From Gallery
  selectImages() async {
    screenController.isLoading(true);
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    for (int i = 0; i < selectedImages!.length; i++) {
      screenController.imageFileList.add(selectedImages[i]);
    }
    screenController.isLoading(false);
    log("Images Length : ${screenController.imageFileList.length}");
  }
}

class BuilderImagesGridViewModule extends StatelessWidget {
  BuilderImagesGridViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.apiImagesList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        NetworkImage(screenController.apiImagesList[i].image),
                    fit: BoxFit.cover,
                  )),
            ),
            IconButton(
              onPressed: () async {
                await screenController.deletePropertyImageFunction(
                    screenController.apiImagesList[i].id
                );
              },
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    ).commonAllSidePadding(padding: 10);
  }
}


/// Builder Property Video Module (Upload & Show)

class BuilderPropertyVideoUploadModule extends StatelessWidget {
  BuilderPropertyVideoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();
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

class BuilderPropertyVideoShowModule extends StatelessWidget {
  BuilderPropertyVideoShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();

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

class ProjectVideoUploadModule extends StatelessWidget {
  ProjectVideoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();
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

class ProjectVideoLinkListModule extends StatelessWidget {
  ProjectVideoLinkListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddBuilderPropertyImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.propertyYtLinkList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        YtLinkDatum singleItem = screenController.propertyYtLinkList[i] as YtLinkDatum;
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
