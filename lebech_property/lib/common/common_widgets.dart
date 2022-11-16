import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_functions.dart';

class CustomCircularProgressIndicatorModule extends StatelessWidget {
  const CustomCircularProgressIndicatorModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: AppColors.greenColor));
  }
}

class FormMainHeaderModule extends StatelessWidget {
  final String text;

  const FormMainHeaderModule({Key? key, required this.text}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class FormSubHeaderModule extends StatelessWidget {
  final String text;

  const FormSubHeaderModule({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}

class HeadingModule extends StatelessWidget {
  final String heading;

  const HeadingModule({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}

/// Social Media Icons
class SocialMediaIconsModule extends StatelessWidget {
  const SocialMediaIconsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () async {
              // log("Gmail Click");
              await gmailOnTapFunction();
            },
            child: Image.asset(
              AppImages.gmailIconImg,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
          GestureDetector(
            onTap: () async {
              await phoneOnTapFunction();
            },
            child: Image.asset(
              AppImages.mobileIconImg,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
          GestureDetector(
            onTap: () async {
              log("Telegram Click");
              await telegramOnTapFunction();
            },
            child: Image.asset(
              AppImages.telegramIconImg,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
          GestureDetector(
            onTap: () async {
              log("Whatsapp Click");
              await whatsappOnTapFunction();
            },
            child: Image.asset(
              AppImages.whatsappIconImg,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),

          /*Expanded(
            child: Image.asset(
              AppImages.gmailIconImg,
              fit: BoxFit.contain,
              height: 40,
              width: 30,
            ),
          ),
          Expanded(
            child: Image.asset(
                AppImages.mobileIconImg,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Image.asset(
                AppImages.telegramIconImg,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Image.asset(
                AppImages.whatsappIconImg,
              fit: BoxFit.contain,
            ),
          ),*/
        ],
      ),
    );
  }
}


class Header1 extends StatelessWidget {
  final String text;
  const Header1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  final String text;
  const Header2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.grey,
      ),
    ).commonAllSidePadding(padding: 5);
  }
}