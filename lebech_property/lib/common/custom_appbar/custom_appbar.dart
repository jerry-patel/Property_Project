import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({String? title = ""}) {
  return AppBar(
    title: Text(
      '$title',
    ),
    // actions: [
    //   IconButton(onPressed: (){
    //     Get.to(() => SignInScreen());
    //   }, icon: const Icon(Icons.login_rounded)),
    // ],
  );
}