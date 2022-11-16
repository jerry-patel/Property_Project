import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_functions.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_drawer/custom_drawer.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Lebech Property'),
          bottom: PreferredSize(
            child: SearchBarModule(),
            preferredSize: const Size.fromHeight(60),
          ),
        ),

        drawer: const CustomDrawer(),

        body: Obx(
            () => homeScreenController.isLoading.value
                ? const CustomCircularProgressIndicatorModule()
                : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BannerModule(),
                    const SizedBox(height: 5),
                    BannerIndicatorModule(),
                    const SizedBox(height: 10),

                    NewProjectsModule(),
                    const SizedBox(height: 10),

                    YoutubeVideoModule(),
                    const SizedBox(height: 10),

                    NewListingsModule(),
                    const SizedBox(height: 10),

                    // const AminitiesTextModule(),
                    // const SizedBox(height: 10),

                    // AminitiesModule(),
                    // const SizedBox(height: 10),

                    FeaturedListingsModule(),
                    const SizedBox(height: 20),

                    FavouriteProjectsModule(),
                    const SizedBox(height: 20),


                    // Banner2Module(),
                    // const SizedBox(height: 10),
                    // LatestNewsFeedModule(),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
            )
        ),

      ),
    );
  }
}
