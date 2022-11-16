import 'package:get/get.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/sharedpreference_data/sharedpreference_data.dart';

class SelectApplicationTypeScreenController extends GetxController {
  RxBool isLoading = false.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
  ApplicationType applicationType = ApplicationType.buyer;

}