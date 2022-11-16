import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/buyer/models/contact_list_screen_model/contact_list_screen_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';


class ContactListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<Datum> contactsList = [];

  Future<void> contactListFunction() async {
    isLoading(true);
    String url = ApiUrl.contactListApi;

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("Contact List Api Response : ${response.body}");

      ContactListModel contactListModel = ContactListModel.fromJson(json.decode(response.body));
      isSuccessStatus = contactListModel.status.obs;

      if(isSuccessStatus.value) {
        contactsList.clear();

        contactsList = contactListModel.data.data;
      } else {
        log("contactListFunction Else Else");
      }

    } catch(e) {
      log("contactListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    contactListFunction();
    super.onInit();
  }

}