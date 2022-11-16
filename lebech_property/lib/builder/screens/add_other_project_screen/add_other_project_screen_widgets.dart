import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/controllers/add_other_project_screen_controller/add_other_project_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';

class ProjectNameFieldModule extends StatelessWidget {
  ProjectNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddOtherProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Project Name"),
        TextFormField(
          controller: screenController.projectNameFieldController,
          keyboardType: TextInputType.text,
          decoration: commonFieldDecoration(hintText: 'Project Name'),
          validator: (value) => FieldValidations().validateFullName(value!),
        ),
      ],
    );
  }
}

class ProjectImageModule extends StatelessWidget {
  ProjectImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddOtherProjectScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Image"),
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
            Expanded(
              child: screenController.selectedFile.path.toString() != ""
                  ? Text(
                      screenController.selectedFile.path,
                      maxLines: 3,
                    )
                  : const Text("No file Chosen"),
            ),
          ],
        ),
      ],
    );
  }

  // Select Multiple Images From Gallery
  selectImages() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    screenController.selectedFile = file!;

    screenController.isLoading(true);
    screenController.isLoading(false);
  }
}

class ProjectAddressFieldModule extends StatelessWidget {
  ProjectAddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddOtherProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Project Address"),
            TextFormField(
              controller: screenController.projectAddressFieldController,
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: commonFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateFullName(value!),
            )
          ],
        )
      ],
    );
  }
}

class ProjectAddButton extends StatelessWidget {
  ProjectAddButton({Key? key}) : super(key: key);
  final screenController = Get.find<AddOtherProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.formKey.currentState!.validate()) {
          if(screenController.selectedFile.path.toString() == "") {
            Fluttertoast.showToast(msg: "Please select image!");
          } else {
            await screenController.addOtherProjectFunction();
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blueColor,
        ),
        child: const Text(
          "Add",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 25, vertical: 15),
      ),
    );
  }
}

class OtherProjectsListModule extends StatelessWidget {
  OtherProjectsListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddOtherProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Other Project List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 10),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: screenController.otherProjectsList.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: 50,
                          child: Image.network(
                            screenController.otherProjectsList[i].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await screenController.deleteOtherProjectFunction(
                                    screenController.otherProjectsList[i].id
                                );
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
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
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 7,
                        child: Text(screenController.otherProjectsList[i].name),
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 7,
                        child: Text(screenController.otherProjectsList[i].address),
                      ),
                    ],
                  ),
                ],
              ).commonAllSidePadding(padding: 8),
            ).commonSymmetricPadding(vertical: 8);
          },
        ),

      ],
    );
  }
}

