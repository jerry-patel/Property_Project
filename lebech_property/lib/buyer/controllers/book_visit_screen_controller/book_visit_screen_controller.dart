import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/book_visit_screen_model/book_visit_details_model.dart';
import 'package:lebech_property/buyer/models/book_visit_screen_model/visit_booked_model.dart';
import 'package:lebech_property/buyer/screens/visit_list_screen/visit_list_screen.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';



class BookVisitScreenController extends GetxController {
  /// Getting From Home Screen
  int id = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<Branch> branchList = [Branch(title: "Search near by branch")];
  Branch branchValue = Branch();

  List<Time> timeSlotList = [Time(slot: "Select time slot")];
  Time timeSlotValue = Time();

  Property propertyDetails = Property();


  /// Get Book Details
  getBookDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getVisitDetailsApi;
    log("Book Details API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['id'] = "$id";

      log("Headers : ${request.headers}");
      log("Fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) async {
        BookVisitDetailsModel bookVisitDetailsModel = BookVisitDetailsModel.fromJson(json.decode(dataLine));
        isSuccessStatus = bookVisitDetailsModel.status.obs;
        log("Visit Details isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          // Branch List DD
          branchList.clear();
          branchList.add(Branch(title: "Search near by branch", id: 0));
          branchList.addAll(bookVisitDetailsModel.data.branch);
          branchValue = branchList[0];

          // Time Slot DD
          timeSlotList.clear();
          timeSlotList.add(Time(slot: "Select time", id: 0));
          timeSlotList.addAll(bookVisitDetailsModel.data.time);
          timeSlotValue = timeSlotList[0];

          // Property Details Set
          propertyDetails = bookVisitDetailsModel.data.property;


        } else {
          log("getBookDetailsFunction Else Else");
        }
      });
    } catch(e) {
      log("getBookDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Book Visit
  bookVisitFunction() async {
    isLoading(true);
    String url = ApiUrl.saveVisitApi;
    log("Save Visit API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['time_slot_id'] = "${timeSlotValue.id}";
      request.fields['branch_id'] = "${branchValue.id}";
      request.fields['property_id'] = "${propertyDetails.id}";

      log("Headers : ${request.headers}");
      log("Fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) async {
        VisitBookedModel visitBookedModel = VisitBookedModel.fromJson(json.decode(dataLine));
        isSuccessStatus = visitBookedModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: visitBookedModel.data.msg);
          await Get.off(()=> VisitListScreen(),
              transition: Transition.zoom);
        } else {
          log("bookVisitFunction Else Else");
        }
      });

    } catch(e) {
      log("bookVisitFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getBookDetailsFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}