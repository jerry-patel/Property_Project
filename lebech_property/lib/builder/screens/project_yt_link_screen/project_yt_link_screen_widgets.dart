import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_yt_link_screen_controller/project_yt_link_screen_controller.dart';
import 'package:lebech_property/builder/models/project_yt_link_screen_model/project_yt_link_model.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';



class YouTubeVideoLinkModule extends StatefulWidget {
  TextEditingController ytLinkController;
  List<bool> ytLinkStatusList;
  bool ytLinkStatus;
  int index;

  YouTubeVideoLinkModule({
    Key? key,
    required this.ytLinkController,
    required this.ytLinkStatusList,
    required this.ytLinkStatus,
    required this.index,
  }) : super(key: key);

  @override
  State<YouTubeVideoLinkModule> createState() => _YouTubeVideoLinkModuleState();
}

class _YouTubeVideoLinkModuleState extends State<YouTubeVideoLinkModule> {
  final screenController = Get.find<ProjectYtLinkScreenController>();

  // TextEditingController ytVideoLinkController = TextEditingController();
  // List<bool> ytVideoLinkStatusList = [true, false];
  // bool ytLinkStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.index == 0
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      screenController.isLoading(true);
                      screenController.ytLinkList.removeAt(widget.index);
                      screenController.ytLinkTextControllerList
                          .removeAt(widget.index);
                      screenController.isLoading(false);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blueColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ).commonAllSidePadding(padding: 2),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.ytLinkController,
          keyboardType: TextInputType.text,
          decoration:
              builderCreateProjectFieldDecoration(hintText: 'YouTube Link'),
          // validator: (value) => FieldValidations().validateFullName(value!),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                width: Get.width, //gives the width of the dropdown button
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                    buttonTheme: ButtonTheme.of(context).copyWith(
                      alignedDropdown: true,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<bool>(
                      value: widget.ytLinkStatus,
                      items: widget.ytLinkStatusList
                          .map<DropdownMenuItem<bool>>((bool value) {
                        return DropdownMenuItem<bool>(
                          value: value,
                          child: Text(
                            value.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // screenController.isLoading(true);
                        setState(() {
                          widget.ytLinkStatus = value!;
                        });
                        // screenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }
}

class YtLinkListModule extends StatelessWidget {
  YtLinkListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectYtLinkScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.ytLinkApiList.isEmpty
        ? const Text("No Data Available!")
        : ListView.builder(
            itemCount: screenController.ytLinkApiList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              YtLinkDatum singleItem = screenController.ytLinkApiList[i];
              return _priceRangeListTile(singleItem);
            },
          );
  }

  Widget _priceRangeListTile(YtLinkDatum singleItem) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "YouTube Video Link",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.link)),
            ],
          ),
          // const SizedBox(width: 5),

          /*Row(
            children: [
              const Expanded(
                child: Text(
                  "Travel Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.time)),
            ],
          ),
          const SizedBox(width: 5),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(singleItem.active == 1 ? "True" : "False"),
              ),
            ],
          ),*/
        ],
      ).commonAllSidePadding(padding: 5),
    ).commonAllSidePadding(padding: 5);
  }
}
