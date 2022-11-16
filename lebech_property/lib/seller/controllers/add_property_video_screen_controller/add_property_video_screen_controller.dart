import 'dart:convert';
import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/seller/models/upload_property_video_screen_model/get_property_video_model.dart';
import 'package:lebech_property/seller/models/upload_property_video_screen_model/upload_property_video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddSellerPropertyVideoScreenController extends GetxController {
  final projectId = Get.arguments[0];
  final projectTitle = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  XFile projectVideo = XFile("");
  // YoutubePlayerController projectApiVideoController = YoutubePlayerController(initialVideoId: "");

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  String propertyApiVideo = '';


  // Get Property Video
  Future<void> getProjectVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.sellerGetPropertyVideoApi;
    log("Project Video Api Url 333 : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$projectId";
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
            isLoading(false);
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
  }

  /// Get Youtube Video URL
  /*void runYoutubeVideo({required String ytLink}) {
    projectApiVideoController = YoutubePlayerController(
      initialVideoId: "${YoutubePlayer.convertUrlToId(ytLink)}",
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }*/

  // Add Property Video
  Future<void> uploadPropertyVideoFunction() async {
    isLoading(true);
    String url = ApiUrl.sellerUploadPropertyVideoApi;
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

      request.fields['property_id'] = "$projectId";

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


  @override
  void onInit() {
    log("projectId : $projectId");
    getProjectVideoFunction();
    super.onInit();
  }


}