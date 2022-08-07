import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manek_test/app/db/db_config.dart';
import '../../../global/overlay.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class CartController extends GetxController {
  var localProductList = List.empty(growable: true).obs;
  Dbconfig? dbconfig;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // instance of db
    dbconfig = Dbconfig();

    // fetch product from sqf db
    fetchSqfDbProduct();

    // for ui overlay
    UiOverlayCustom.returnUiColorOnDemand(
        sBB: Brightness.light,
        sBC: const Color(0XFF354557),
        sBIB: Brightness.light,
        sNBC: const Color(0XFF354557));
  }

  // making function for fetching sqf db product
  fetchSqfDbProduct() {
    dbconfig!.getProFromSqlite().then((value) {
      localProductList.assignAll(value);
      productsSum();
    }).onError((error, stackTrace) {
      // ignore: avoid_print
      print(error.toString());
    });
  }

  // delete product from sqf database
  deleteProduct(int id) {
    dbconfig!.deleteProduct(id).then((value) {
      showCustomSnackBar("Successfully Deleted", "Well Done Man!",
          const Color(0xffa7f3d0), Icons.check, Colors.black);
      // fetch again product for refresh list
      dbconfig!.getProFromSqlite().then((value) {
        localProductList.assignAll(value);
      }).onError((error, stackTrace) {
        // ignore: avoid_print
        print(error.toString());
      });
    }).catchError((error) {
      showCustomSnackBar("Failed", "Oops some error!", const Color(0xfff87171),
          Icons.warning, Colors.black);
    });
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

  // total items in cart
  getTotalItemsInCart() {
    return localProductList.length;
  }

  // get total items amount

  productsSum() {
    num total = 0;

    for (var i = 0; i < localProductList.length; i++) {
      total = total + localProductList[i]["pro_price"];
    }

    return total;
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
