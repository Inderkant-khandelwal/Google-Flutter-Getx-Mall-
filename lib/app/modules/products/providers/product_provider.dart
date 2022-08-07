import 'dart:convert';
import 'package:get/get.dart';
import '../model/product_model.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class ProductProvider extends GetConnect {
  Future<Product> getProducts() async {
    try {
      final response = await get(
          'http://205.134.254.135/~mobile/MtProject/public/api/product_list.php');
      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        return Future.error("Something Wrong");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
