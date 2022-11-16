import 'dart:developer';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/controllers/add_project_images_screen_controller/add_project_images_screen_controller.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProjectImageUploadModule extends StatelessWidget {
  ProjectImageUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();
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
                child: const Text(
                    "Choose File"
                ).commonAllSidePadding(padding: 15),
              ),
            ),
            const SizedBox(width: 8),

            screenController.imageFileList.isNotEmpty
                ? Text(
                "${screenController.imageFileList.length} files selected"
            )
                : const Text("No file Chosen"),
          ],
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                await screenController.addProjectImagesFunction();
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
    for(int i =0; i< selectedImages!.length; i++){
      screenController.imageFileList.add(selectedImages[i]);
    }
    screenController.isLoading(false);
    log("Images Length : ${screenController.imageFileList.length}");
  }

}

class ProjectImagesGridViewModule extends StatelessWidget {
  ProjectImagesGridViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.apiImagesList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
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
                    image: NetworkImage(screenController.apiImagesList[i].image),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            GestureDetector(
              onTap: () async {
                await screenController.deleteProjectImagesFunction(screenController.apiImagesList[i].id);
              },
              child: const Icon(Icons.delete,
              color: Colors.red,),
            ),
          ],
        );
      },
    ).commonAllSidePadding(padding: 10);
  }
}

class ProjectLogoUploadModule extends StatelessWidget {
  ProjectLogoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Project Logo",
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
              child: screenController.projectLogo.path.isNotEmpty
                  ? Text(screenController.projectLogo.path)
                  : const Text("No file Chosen"),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                if(screenController.projectLogo.path.isEmpty) {
                 Fluttertoast.showToast(msg: "Please select project logo");
                } else {
                  await screenController.addProjectLogoFunction();
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
    final XFile? selectedImages = await imagePicker.pickImage(source: ImageSource.gallery);
    screenController.projectLogo = selectedImages!;
    screenController.isLoading(false);
  }

}

class ProjectLogoShowModule extends StatelessWidget {
  ProjectLogoShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        screenController.projectApiImage != ""
        ? SizedBox(
          height: 75,
          width: 75,
          child: Image.network(
              screenController.projectApiImage,
            fit: BoxFit.cover,
            errorBuilder: (ctx, obj, a) {
                return Image.asset(AppImages.banner1Img);
            },
          ),
        )
        : const Text(
          "Logo not available!"
        ),
      ],
    ).commonAllSidePadding(padding: 10);
  }
}


class ProjectVideoUploadModule extends StatelessWidget {
  ProjectVideoUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Project Video",
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
                  Fluttertoast.showToast(msg: "Please select project video");
                } else {
                  await screenController.addProjectVideoFunction();
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
    final XFile? selectedVideo = await imagePicker.pickVideo(source: ImageSource.gallery);
    screenController.projectVideo = selectedVideo!;
    screenController.isLoading(false);
  }

}

class ProjectVideoShowModule extends StatelessWidget {
  ProjectVideoShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.chewieController != null &&
            screenController.videoPlayerController != null &&
            screenController.projectApiVideo != ""
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

class ProjectBrochureUploadModule extends StatelessWidget {
  ProjectBrochureUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.brochureFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Brochure",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),

          TextFormField(
            controller: screenController.brochureNameController,
            keyboardType: TextInputType.text,
            decoration: builderCreateProjectFieldDecoration(hintText: 'Brochure Name'),
            validator: (value) => FieldValidations().validateFullName(value!),
          ),

          const SizedBox(height: 5),

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
                child: screenController.projectBrochure.path.isNotEmpty
                    ? Text(screenController.projectBrochure.path)
                    : const Text("No file Chosen"),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  if(screenController.brochureFormKey.currentState!.validate()) {
                    if(screenController.projectBrochure.path.isEmpty) {
                      Fluttertoast.showToast(msg: "Please select project brochure");
                    } else {
                      await screenController.addProjectBrochureFunction();
                    }
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
      ),
    ).commonAllSidePadding(padding: 10);
  }


  selectImage() async {
    screenController.isLoading(true);
    final FilePickerResult? selectedImages = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(selectedImages!.files.isNotEmpty) {
      screenController.projectBrochure = File("${selectedImages.files[0].path}");
    }
    screenController.isLoading(false);
  }

}

class ProjectBrochureGridModule extends StatelessWidget {
  ProjectBrochureGridModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddProjectImagesScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.brochureList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      // image: DecorationImage(
                      //   image: NetworkImage(screenController.brochureList[i].file),
                      //   fit: BoxFit.cover,
                      // )
                  ),
                  child: SfPdfViewer.network(screenController.brochureList[i].file),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: GestureDetector(
                    onTap: () async {
                      await screenController.deleteProjectBrochureFunction(screenController.brochureList[i].id);
                    },
                    child: const Icon(Icons.delete,
                      color: Colors.red,),
                  ),
                ),
              ],
            ),
            Text(
              screenController.brochureList[i].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        );
      },
    ).commonAllSidePadding(padding: 10);
  }
}
