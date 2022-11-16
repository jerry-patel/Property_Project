import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/models/add_other_project_screen_model/delete_project_image_model.dart';
import 'package:lebech_property/builder/models/add_project_images_screen_model/project_brochure_model.dart';
import 'package:lebech_property/builder/models/add_project_images_screen_model/project_image_model.dart';
import 'package:lebech_property/builder/models/add_project_images_screen_model/project_logo_model.dart';
import 'package:lebech_property/builder/models/add_project_images_screen_model/project_video_model.dart';
import 'package:lebech_property/builder/models/add_project_images_screen_model/upload_project_video_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/models/add_property_image_screen_model/add_property_image_model.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class AddProjectImagesScreenController extends GetxController {
  final projectId = Get.arguments[0];
  final projectTitle = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<XFile> imageFileList = [];
  List imageLengthList = [];
  List streamLengthList = [];
  List multipartList = [];

  List<ProjectImageDatum> apiImagesList = [];


  XFile projectLogo = XFile("");
  XFile projectVideo = XFile("");
  File projectBrochure = File("");
  String projectApiImage = "";
  String projectApiVideo= "";
  YoutubePlayerController projectApiVideoController = YoutubePlayerController(initialVideoId: "");
  // VideoPlayerController? videoPlayerController;
  GlobalKey<FormState> brochureFormKey = GlobalKey();
  TextEditingController brochureNameController = TextEditingController();

  List<BrochureData> brochureList = [];


  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;


  // Add Project Image
  Future<void> addProjectImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.addProjectImagesApi;
    log("Add Property Images Api Url 1234 :$url");

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
        var multiPart = http.MultipartFile('images[$i]', streamLengthList[i], imageLengthList[i]);
        request.files.add(multiPart);
      }

      request.fields['project_id'] = "$projectId";

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async{
        log("Value : $value");
        AddPropertyImageModule addPropertyImageModule = AddPropertyImageModule.fromJson(json.decode(value));
        isSuccessStatus = addPropertyImageModule.status.obs;
        log('isSuccessStatus AAAAA: ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addPropertyImageModule.data.msg);
          // log("Message : ${addPropertyImageModule.message}");
          imageFileList.clear();
          await getProjectImagesFunction();
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

  // Get Project Image
  Future<void> getProjectImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.getProjectImagesApi;
    log("Get Project Images Api Url 111 : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$projectId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
        //'Authorization': "Bearer 85|nE54BkonvXUdxxTyZKT8KVXz0rYkaD8EokJjZzKv"
      };
      log("sellerHeader : $sellerHeader");
      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Property Response :${response.body}");

      ProjectImageModel propertyImagesModel = ProjectImageModel.fromJson(json.decode(response.body));
      isSuccessStatus = propertyImagesModel.status.obs;

      if(isSuccessStatus.value) {
        apiImagesList.clear();
        apiImagesList.addAll(propertyImagesModel.data.data);
      } else {
        log("Get Property Images Api Else");
      }


    } catch(e) {
      log("Get Property Image Error ::: $e");
    } finally {
      // isLoading(false);
      await getProjectLogoFunction();
    }
  }

  // Delete Project Images
  Future<void> deleteProjectImagesFunction(int id) async {
    isLoading(true);
    String url = ApiUrl.deleteBuilderProjectImageApi;
    log("Delete Project Images Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['id'] = "$id";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {

        DeleteProjectImageModel deleteProjectImageModel = DeleteProjectImageModel.fromJson(json.decode(value));
        isSuccessStatus = deleteProjectImageModel.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deleteProjectImageModel.data.msg);
          await getProjectImagesFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }
      });

    } catch(e) {
      log("Delete Project Images Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }



  // Get Project Logo
  Future<void> getProjectLogoFunction() async {
    isLoading(true);
    String url = ApiUrl.projectLogoApi;
    log("Get Project Logo Api Url 222 : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$projectId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
        //'Authorization': "Bearer 85|nE54BkonvXUdxxTyZKT8KVXz0rYkaD8EokJjZzKv"
      };
      log("sellerHeader : $sellerHeader");
      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Project Response :${response.body}");

      ProjectLogoModel propertyImagesModel = ProjectLogoModel.fromJson(json.decode(response.body));
      isSuccessStatus = propertyImagesModel.status.obs;

      if(isSuccessStatus.value) {
        projectApiImage = propertyImagesModel.data.data.logo;
        log("projectApiImage : $projectApiImage");
      } else {
        log("Get Property Images Api Else");
      }


    } catch(e) {
      log("Get Property Image Error ::: $e");
    } finally {
      // isLoading(false);
      await getProjectVideoFunction();
    }
  }

  // Add Project Logo
  Future<void> addProjectLogoFunction() async {
    isLoading(true);
    String url = ApiUrl.addProjectLogoApi;
    log("Add Project Logo Api Url :$url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      var stream = http.ByteStream(projectLogo.openRead());
      stream.cast();

      var length = await projectLogo.length();

      request.files.add(await http.MultipartFile.fromPath("image", projectLogo.path));


      var multiPart = http.MultipartFile('image', stream, length);
      request.files.add(multiPart);


      request.fields['project_id'] = "$projectId";

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("Value : $value");
        AddPropertyImageModule addPropertyImageModule = AddPropertyImageModule.fromJson(json.decode(value));
        isSuccessStatus = addPropertyImageModule.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addPropertyImageModule.data.msg);
          projectLogo = XFile("");
          await getProjectLogoFunction();
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



  // Get Project Video
  Future<void> getProjectVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.projectVideoApi;
    log("Project Video Api Url 333 : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$projectId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };

      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Property Response :${response.body}");

      ProjectVideoModel projectVideoModel = ProjectVideoModel.fromJson(json.decode(response.body));
      isSuccessStatus = projectVideoModel.status.obs;

      if(isSuccessStatus.value) {
        projectApiVideo = projectVideoModel.data.data.video;
        log("projectApiVideo : $projectApiVideo");

        if(projectVideoModel.data.data.video != "") {
          videoPlayerController = VideoPlayerController.network(projectApiVideo);
          videoPlayerController!.initialize().then((value) {
            chewieController = ChewieController(videoPlayerController: videoPlayerController!);
          });
        }

        await Future.delayed(const Duration(seconds: 3), () async {
          await getProjectBrochureFunction();
        },);

        // runYoutubeVideo(ytLink: projectApiVideo);
      } else {
        log("getProjectVideoFunction Else Else");
      }


    } catch(e) {
      log("getProjectVideoFunction Error ::: $e");
    } finally {
      // isLoading(false);


      // await getProjectBrochureFunction();
    }


  }

  /// Get Youtube Video URL
 /* void runYoutubeVideo({required String ytLink}) {
    projectApiVideoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ytLink)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }*/

  // Add Project Video
  Future<void> addProjectVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.addProjectVideoApi;
    log("Add Project Video Api Url :$url");

    try {
      Map<String, String> sellerHeader = <String,String> {
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer ${UserDetails.userToken}"
      };

      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(sellerHeader);
      request.fields['project_id'] = "$projectId";
      request.files.add(await http.MultipartFile.fromPath('video', projectVideo.path));
      request.send().then((response) {
        http.Response.fromStream(response).then((onValue) async {
          try {
            // response.stream.transform(utf8.decoder).listen((value) async {
              log("onValue Body : ${onValue.body}");
              UploadProjectVideoModel addPropertyImageModule = UploadProjectVideoModel.fromJson(json.decode(onValue.body));
              isSuccessStatus = addPropertyImageModule.status.obs;
              log('isSuccessStatus Video : ${isSuccessStatus.value}');

              if(isSuccessStatus.value) {
                Fluttertoast.showToast(msg: addPropertyImageModule.data.msg);
                // log("Message : ${addPropertyImageModule.message}");
                projectVideo = XFile("");
                await getProjectVideoFunction();
              } else {
                log('addPropertyImagesFunction Else');
              }

            // });
          } catch (e) {
            // handle exeption
          }
        });
      });

      // var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(sellerHeader);
      //
      // var stream = http.ByteStream(projectVideo.openRead());
      // stream.cast();
      //
      // var length = await projectVideo.length();
      //
      // request.files.add(await http.MultipartFile.fromPath("video", projectVideo.path));
      //
      //
      // var multiPart = http.MultipartFile('video', stream, length);
      // request.files.add(multiPart);
      //
      //
      // request.fields['project_id'] = "$projectId";
      //
      // // log("request.files : ${request.files}");
      // for (var element in request.files) {
      //   log("request.files : ${element.filename}");
      // }
      // log("request.fields : ${request.fields}");
      // log("request.headers : ${request.headers}");
      //
      // var response = await request.send();
      // log("Send");

      // response.stream.transform(utf8.decoder).listen((value) async {
      //   // log("Value : $value");
      //   UploadProjectVideoModel addPropertyImageModule = UploadProjectVideoModel.fromJson(json.decode(value));
      //   isSuccessStatus = addPropertyImageModule.status.obs;
      //   log('isSuccessStatus Video : ${isSuccessStatus.value}');
      //
      //   if(isSuccessStatus.value) {
      //     Fluttertoast.showToast(msg: addPropertyImageModule.data.msg);
      //     // log("Message : ${addPropertyImageModule.message}");
      //     projectVideo = XFile("");
      //     await getProjectVideoFunction();
      //   } else {
      //     log('addPropertyImagesFunction Else');
      //   }
      //
      // });

    } catch(e) {
      log("Add Property Images Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  // Add Project Brochure
  Future<void> addProjectBrochureFunction() async {
    isLoading(true);
    String url = ApiUrl.uploadProjectBrochureApi;
    log("Add Project Brochure Api Url :$url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      var stream = http.ByteStream(projectBrochure.openRead());
      stream.cast();

      var length = await projectBrochure.length();

      request.files.add(await http.MultipartFile.fromPath("brochure", projectBrochure.path));


      var multiPart = http.MultipartFile('brochure', stream, length);
      request.files.add(multiPart);


      request.fields['project_id'] = "$projectId";
      request.fields['title'] = brochureNameController.text.trim();

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("Value : $value");
        AddPropertyImageModule addPropertyImageModule = AddPropertyImageModule.fromJson(json.decode(value));
        isSuccessStatus = addPropertyImageModule.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addPropertyImageModule.data.msg);
          projectBrochure = File("");
          brochureNameController.clear();
          await getProjectBrochureFunction();
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

  // Get Project Brochure
  Future<void> getProjectBrochureFunction() async {
    isLoading(true);
    String url = ApiUrl.getProjectBrochureApi;
    log("Get Project Brochure Api Url 222 : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$projectId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };
      log("sellerHeader : $sellerHeader");
      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Project Response :${response.body}");

      GetProjectBrochureModel propertyImagesModel = GetProjectBrochureModel.fromJson(json.decode(response.body));
      isSuccessStatus = propertyImagesModel.status.obs;

      if(isSuccessStatus.value) {
        brochureList.clear();
        brochureList.addAll(propertyImagesModel.data.data);
        log("brochureList : ${brochureList.length}");
      } else {
        log("Get Property Images Api Else");
      }


    } catch(e) {
      log("Get Property Image Error ::: $e");
    } finally {
      isLoading(false);
      // await getProjectVideoFunction();
    }
  }

  // Delete Project Brochure
  Future<void> deleteProjectBrochureFunction(int id) async {
    isLoading(true);
    String url = ApiUrl.deleteProjectBrochureApi;
    log("Delete Project Brochure Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['id'] = "$id";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {

        DeleteProjectImageModel deleteProjectImageModel = DeleteProjectImageModel.fromJson(json.decode(value));
        isSuccessStatus = deleteProjectImageModel.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deleteProjectImageModel.data.msg);
          await getProjectBrochureFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }
      });

    } catch(e) {
      log("Delete Project Images Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getProjectImagesFunction();
    // chewieController = ChewieController(videoPlayerController: videoPlayerController!);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
    chewieController!.dispose();
  }

}