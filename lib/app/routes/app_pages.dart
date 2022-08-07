import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_view.dart';

part 'app_routes.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
  ];
}
