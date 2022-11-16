import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/checkout_screen_model/buy_contact_model.dart';
import 'package:lebech_property/buyer/screens/payment_success_screen/payment_success_screen.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;


class CheckoutScreenController extends GetxController {
  /// From Buy Owner Number Module
  int id = Get.arguments[0] ?? 0;
  String img = Get.arguments[1] ?? "";
  String name = Get.arguments[2] ?? "";
  int price = Get.arguments[3] ?? 0;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  var razorpay = Razorpay();
  String orderId = "";
  String paymentId = "";
  String signature = "";


  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    orderId = response.orderId ?? "";
    paymentId = response.paymentId ?? "";
    signature = response.signature ?? "";
    log("orderId : $orderId");
    log("paymentId : $paymentId");
    log("signature : $signature");

    await buyContactFunction();


  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "${response.message}");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "${response.walletName}");
    // Do something when an external wallet is selected
  }

  Future<void> buyContactFunction() async {
    isLoading(true);
    String url = ApiUrl.buyContactApi;
    log("Buy Contact API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['property_id'] = "$id";
      request.fields['amount'] = "$price";
      request.fields['razorpay_payment_id'] = paymentId;
      request.fields['razorpay_order_id'] = orderId;
      request.fields['razorpay_signature'] = signature;

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) async {
        BuyContactModel buyContactModel = BuyContactModel.fromJson(json.decode(dataLine));

        isSuccessStatus = buyContactModel.status.obs;

        if(isSuccessStatus.value) {
          Get.off(()=> const PaymentSuccessScreen(),
          transition: Transition.zoom,);
          Fluttertoast.showToast(msg: buyContactModel.data.msg);
        } else {
          log("Buy Contact Function Else Else");
        }


      });

    } catch(e) {
      log("Buy Contact Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

}