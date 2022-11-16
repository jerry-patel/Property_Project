import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:lebech_property/buyer/models/home_screen_model/home_screen_model.dart';
import 'package:lebech_property/buyer/screens/about_us_screen/about_us_screen.dart';
import 'package:lebech_property/buyer/screens/category_property_screen/category_property_screen.dart';
import 'package:lebech_property/buyer/screens/project_list_screen/project_list_screen.dart';
import 'package:lebech_property/common/constants/app_colors.dart';

class DrawerCategoryNameTextModule extends StatelessWidget {
  const DrawerCategoryNameTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Text(
        "Category",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.greenColor,
        ),
      ),
    );
  }
}


class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeScreenController.categoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        CategoryNew singleCategory = homeScreenController.categoryList[i];
        return _categoryListTile(singleCategory);
      },
    );
  }

  Widget _categoryListTile(CategoryNew singleCategory) {
    return ListTile(
      onTap: () {
        List<HomePropertyType> subCategoryList = [];

        for(int i = 0; i < homeScreenController.propertyTypeList.length; i++) {
          if(singleCategory.id == homeScreenController.propertyTypeList[i].category!.id) {
            subCategoryList.add(homeScreenController.propertyTypeList[i]);
          }
        }

        log("subCategoryList : ${subCategoryList.length}");

        Get.back();
        Get.to(
          () => CategoryPropertyScreen(),
          arguments: subCategoryList,
        );
      },
      title: Text(
        singleCategory.name,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

}

/*class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeScreenController,
    );
  }
}*/

// class ResidentialCategoryModule extends StatelessWidget {
//   ResidentialCategoryModule({Key? key}) : super(key: key);
//   final homeScreenController = Get.find<HomeScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Get.back();
//         Get.to(() => CategoryPropertyScreen(), arguments: "1");
//       },
//       title: const Text(
//         "Residential",
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }
//
// class CommercialCategoryModule extends StatelessWidget {
//   const CommercialCategoryModule({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Get.back();
//         Get.to(() => CategoryPropertyScreen(), arguments: "2");
//       },
//       title: const Text(
//         "Commercial",
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }
//
// class IndustrialCategoryModule extends StatelessWidget {
//   const IndustrialCategoryModule({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Get.back();
//         Get.to(() => CategoryPropertyScreen(), arguments: "3");
//       },
//       title: const Text(
//         "Industrial",
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }
//
// class TextileSpaceCategoryModule extends StatelessWidget {
//   const TextileSpaceCategoryModule({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Get.back();
//         Get.to(() => CategoryPropertyScreen(), arguments: "4");
//       },
//       title: const Text(
//         "Textile Space",
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }

class ProjectsModule extends StatelessWidget {
  const ProjectsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ProjectListScreen());
      },
      title: const Text(
        "Projects",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class AboutUsModule extends StatelessWidget {
  const AboutUsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AboutUsScreen());
      },
      title: const Text(
        "About Us",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}