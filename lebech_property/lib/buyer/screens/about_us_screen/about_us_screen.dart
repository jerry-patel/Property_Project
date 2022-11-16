import 'package:flutter/material.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'about_us_screen_widgets.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "About Us"),

      body: SingleChildScrollView(
        child: Column(
          children: const [
            AboutUsImageModule(),
            SizedBox(height: 10),

            Text(
              "The Leading Real Estate Rental Marketplace.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 10),

            Text(
              "Launched in 2022, lebechproperty.com, deals with every aspect of the consumers’ needs in the real estate industry. It is an online forum where buyers, sellers and brokers/agents can offer servies about real estate properties quickly, effectively and inexpensively. At lebechproperty.com, you can advertise a property, search for a property, browse through properties, and keep yourself updated with the latest news and trends making headlines in the realty sector."
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
