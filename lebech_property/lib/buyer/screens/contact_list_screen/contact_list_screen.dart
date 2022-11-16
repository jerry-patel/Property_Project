import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/contact_list_screen_controller/contact_list_screen_controller.dart';
import '../../models/contact_list_screen_model/contact_list_screen_model.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);
  final contactListScreenController = Get.put(ContactListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Contacts"),
      body: Obx(
        () => contactListScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : contactListScreenController.contactsList.isEmpty
                ? const Center(child: Text("No Data Available!"))
                : ListView.builder(
                    itemCount: contactListScreenController.contactsList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      Datum singleItem = contactListScreenController.contactsList[i];
                      return _contactListTile(singleItem);
                    },
                  ),
      ),
    );
  }

  Widget _contactListTile(Datum singleItem) {
    String imgUrl = singleItem.image[0].image;
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Expanded(
            // flex: 45,
            child: _imagesListModule(imgUrl),
          ),
          _propertyDetailsModule(singleItem),
          /*Expanded(
            flex: 55,
            child: _propertyDetailsModule(),
          ),*/
        ],
      ),
    ).commonAllSidePadding(padding: 10);
  }

  Widget _imagesListModule(String imgUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule(Datum singleItem) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Expanded(
                flex: 35,
                child: Text(
                  "Owner Name : ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 65,
                child: Text(
                  singleItem.owner,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Expanded(
                flex: 35,
                child: Text(
                  "Mobile No. :",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 65,
                child: Text(
                  singleItem.mobile,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
