import 'dart:convert';
import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/models/builder_property_images_screen_model/delete_property_image_model.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/delete_property_link_model.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/get_property_video_link_model.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/upload_yt_link_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/models/add_property_image_screen_model/add_property_image_model.dart';
import 'package:lebech_property/seller/models/add_property_image_screen_model/get_property_images_model.dart';
import 'package:lebech_property/seller/models/upload_property_video_screen_model/get_property_video_model.dart';
import 'package:lebech_property/seller/models/upload_property_video_screen_model/upload_property_video_model.dart';
import 'package:video_player/video_player.dart';

class AddBrokerPropertyImageScreenController extends GetxController {
  final propertyId = Get.arguments[0];
  final propertyTitle = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<XFile> imageFileList = [];
  List imageLengthList = [];
  List streamLengthList = [];
  List multipartList = [];

  List<Datum> apiImagesList = [];

  XFile projectVideo = XFile("");

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  String propertyApiVideo = '';

  TextEditingController ytLinkController = TextEditingController();
  List<YtLinkDatum> propertyYtLinkList = [];


  // Add Property Image
  Future<void> addBrokerPropertyImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.addBrokerPropertyImagesApi;
    log("Add Property Images Api Url :$url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      for(int i = 0; i < imageFileList.length; i++) {
        var stream = http.ByteStream(imageFileList[i].openRead());
        stream.cast();
        streamLengthList.add(stream);
      }

      for(int i = 0; i < imageFileList.length; i++) {
        var length = await imageFileList[i].length();
        imageLengthList.add(length);
      }

      for(int i = 0; i < imageFileList.length; i++) {
        request.files.add(await http.MultipartFile.fromPath("images[$i]", imageFileList[i].path));
      }

      for(int i = 0; i < imageFileList.length; i++) {
        var multiPart = http.MultipartFile('Image', streamLengthList[i], imageLengthList[i]);
        request.files.add(multiPart);
      }

      request.fields['property_id'] = "$propertyId";

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async{
        log("Value : $value");
        AddPropertyImageModule addPropertyImageModule = AddPropertyImageModule.fromJson(json.decode(value));
        isSuccessStatus = addPropertyImageModule.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addPropertyImageModule.message);
          // log("Message : ${addPropertyImageModule.message}");
          // Get.back();
          await getPropertyImagesFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }
      });
    } catch(e) {
      log("Add Property Images Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Get Property Image
  Future<void> getPropertyImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.getBrokerPropertyImageListApi;
    log("Get Property Image List Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "property_id" : "$propertyId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
        //'Authorization': "Bearer 85|nE54BkonvXUdxxTyZKT8KVXz0rYkaD8EokJjZzKv"
      };
      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Property Response :${response.body}");

      PropertyImagesModel propertyImagesModel = PropertyImagesModel.fromJson(json.decode(response.body));
      isSuccessStatus = propertyImagesModel.status.obs;

      if(isSuccessStatus.value) {
        apiImagesList.clear();
        apiImagesList.addAll(propertyImagesModel.data.data);
      } else {
        log("Get Property Images Api Else");
      }


    } catch(e) {
      log("Get Property Image Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/
    await getProjectVideoFunction();
  }

  Future<void> deletePropertyImageFunction(int id) async {
    isLoading(true);
    String url = ApiUrl.deleteBrokerPropertyImageApi;
    log("Delete Property Image Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['id'] = "$id";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async{
        log("Value : $value");
        DeletePropertyImageModel deletePropertyImageModel = DeletePropertyImageModel.fromJson(json.decode(value));
        isSuccessStatus = deletePropertyImageModel.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deletePropertyImageModel.data.msg);
          await getPropertyImagesFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }

      });

    } catch(e) {
      log("deletePropertyImageFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  // Get Property Video
  Future<void> getProjectVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.brokerGetPropertyVideoApi;
    log("Project Video Api Url 333 : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value : $value");
        GetPropertyVideoModel getPropertyVideoModel = GetPropertyVideoModel.fromJson(json.decode(value));
        isSuccessStatus = getPropertyVideoModel.status.obs;

        if(isSuccessStatus.value) {
          propertyApiVideo = getPropertyVideoModel.data.data.video;

          videoPlayerController = VideoPlayerController.network(propertyApiVideo);
          videoPlayerController!.initialize().then((value) {
            chewieController = ChewieController(videoPlayerController: videoPlayerController!);
            // isLoading(false);
          });
          // Future.delayed(const Duration(seconds: 2), () {});
          // isLoading(true);
          // isLoading(false);
        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });
    } catch(e) {
      log("getProjectVideoFunction Error ::: $e");
    }
    // isLoading(false);
    await getPropertyYoutubeLinkFunction();
  }

  // Add Property Video
  Future<void> uploadPropertyVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.brokerUploadPropertyVideoApi;
    log("Add Project Video Api Url :$url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      var stream = http.ByteStream(projectVideo.openRead());
      stream.cast();

      var length = await projectVideo.length();

      request.files.add(await http.MultipartFile.fromPath("video", projectVideo.path));


      var multiPart = http.MultipartFile('video', stream, length);
      request.files.add(multiPart);

      request.fields['property_id'] = "$propertyId";

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("Value : $value");
        UploadPropertyVideoModel uploadPropertyVideoModel = UploadPropertyVideoModel.fromJson(json.decode(value));
        isSuccessStatus = uploadPropertyVideoModel.status.obs;
        log('isSuccessStatus Video : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: uploadPropertyVideoModel.data.msg);
          projectVideo = XFile("");
          await getProjectVideoFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }

      });

    } catch(e) {
      log("Add Property Images Function Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/
    isLoading(false);
  }


  // Upload Yt Link
  Future<void> uploadYoutubeLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.addBrokerPropertyYoutubeLinkApi;
    log("Upload Youtube Link Api Url : $url");

    try {
      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(sellerHeader);

      request.fields['property_id'] = "$propertyId";
      request.fields['link'] = ytLinkController.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        UploadPropertyYtLinkModel uploadPropertyYtLinkModel = UploadPropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = uploadPropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: uploadPropertyYtLinkModel.data.msg);
          ytLinkController.clear();
          await getPropertyYoutubeLinkFunction();
        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });

    } catch(e) {
      log("uploadYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Get Yt Link
  Future<void> getPropertyYoutubeLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.getBrokerPropertyYoutubeLinkApi;
    log("Get Property Yt Link Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        GetPropertyYtLinkModel getPropertyYtLinkModel = GetPropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = getPropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          propertyYtLinkList.clear();
          propertyYtLinkList.addAll(getPropertyYtLinkModel.data.data);
          log("propertyYtLinkList Length : ${propertyYtLinkList.length}");

        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });

    } catch(e) {
      log("getPropertyYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
  // Delete Yt Link
  Future<void> deletePropertyYoutubeLinkFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.deleteBrokerPropertyYoutubeLinkApi;
    log("Delete Property Yt Link Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$propertyId";
      request.fields['id'] = "$id";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        DeletePropertyYtLinkModel deletePropertyYtLinkModel = DeletePropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = deletePropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deletePropertyYtLinkModel.data.msg);
          await getPropertyYoutubeLinkFunction();
        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });


    } catch(e) {
      log("deletePropertyYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getPropertyImagesFunction();
    super.onInit();
  }


}