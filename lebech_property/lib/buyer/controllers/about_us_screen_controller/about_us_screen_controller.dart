import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class AboutUsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  /*getAboutUsDataFunction() async {
    isLoading(true);
    String url = "ApiUrl.;";
    log("About Us API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) {


        if (isSuccessStatus.value) {

        } else {
          log("getAboutUsDataFunction Else Else");
        }
      });

    } catch(e) {
      log("getAboutUsDataFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }*/

  // @override
  // void onInit() {
  //   getAboutUsDataFunction();
  //   super.onInit();
  // }
}