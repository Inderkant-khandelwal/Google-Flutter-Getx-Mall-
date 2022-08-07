import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manek_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:manek_test/app/modules/products/bindings/products_binding.dart';
import 'app/routes/app_pages.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

void main() {
  Get.put<CartController>(CartController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Manek_Test_By_Inderkant",
      initialBinding: ProductsBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 1),
    ),
  );
}
