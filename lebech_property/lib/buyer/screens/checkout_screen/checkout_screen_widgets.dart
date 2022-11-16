import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import '../../controllers/checkout_screen_controller/checkout_screen_controller.dart';

class ImageModule extends StatelessWidget {
  ImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
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
            child: _imagesListModule(),
          ),
          _propertyDetailsModule(),
          /*Expanded(
            flex: 55,
            child: _propertyDetailsModule(),
          ),*/
        ],
      ),
    );
  }

  Widget _imagesListModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage(screenController.img.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            screenController.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${screenController.price}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class CartModule extends StatelessWidget {
  CartModule({Key? key}) : super(key: key);
  final screenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cart Totals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Cart Subtotal",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Text(
                "₹${screenController.price}",
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Order Total",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "₹${screenController.price}",
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class BuyButtonModule extends StatelessWidget {
  BuyButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {

          var options = {
            'key': 'rzp_test_Hx2PdNfHQo5A1m',
            'amount': screenController.price * 100,
            'name': 'Acme Corp.',
            'description': 'Lebech  Property',
            'timeout': 300, // in seconds

          };

/*'prefill': {
              'contact': '',
              'email': ''
            }*/
          screenController.razorpay.open(options);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.blueColor,
          ),
          child: const Text(
            "Process to buy",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ).commonSymmetricPadding(horizontal: 24, vertical: 14),
        ),
      ),
    );
  }
}
