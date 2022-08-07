// ignore_for_file: invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manek_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:manek_test/app/modules/products/model/product_model.dart';

import '../../../db/db_config.dart';
import '../../../global/overlay.dart';
import '../providers/product_provider.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class ProductsController extends GetxController {
  final count = 0.obs;
  var totalCart = 0.obs;
  var isInserted = false.obs;
  var isErrorWhileInsertingToLocalDb = false.obs;
  var isErrorWhileFetchingFromInternet = false.obs;
  var productList = <Product>[].obs;
  Dbconfig? dbconfig;

  @override
  void onInit() {
    super.onInit();
    getProductFromServer();
    dbconfig = Dbconfig();
    // for ui overlay
    UiOverlayCustom.returnUiColorOnDemand(
        sBB: Brightness.light,
        sBC: const Color(0XFF354557),
        sBIB: Brightness.light,
        sNBC: const Color(0XFF354557));
  }

  // add product to sqflite
  addProductToSqflite(String? proName, int? price, String imgUrl, {qty = 1}) {
    dbconfig!.addProduct({
      "pro_name": proName,
      "pro_price": price,
      "pro_img": imgUrl,
      "pro_qty": qty
    })
        // ignore: avoid_print
        .then((value) {
      // total cart items for home screen cart number
      totalCart.value = Get.find<CartController>().getTotalItemsInCart();

      // show error to user
      showCustomSnackBar("Successfully Added", "Check your cart now ",
          const Color(0xffa7f3d0), Icons.check, Colors.black);
      dbconfig!.getProFromSqlite().then((valuex) => print(valuex));
    }).onError((error, stackTrace) {
      // print(error.toString());
      showCustomSnackBar("Failed", "Oops some error!", const Color(0xfff87171),
          Icons.warning, Colors.black);
    });
    // ignore: avoid_print
  }

// fetch product from Internet
  getProductFromServer() {
    try {
      ProductProvider().getProducts().then((value) {
        productList.add(value);
        // ignore: avoid_print
      }).catchError((error, stackTrace) => print(error));
    } catch (e) {
      isErrorWhileFetchingFromInternet.value = true;
    }
  }

  // making snackbar for user if product add to cart or not
  showCustomSnackBar(
      String tit, String mes, Color clr, IconData icon, Color iclr) {
    Get.snackbar(tit, mes,
        backgroundColor: clr,
        icon: Icon(icon, color: iclr),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 5);
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
