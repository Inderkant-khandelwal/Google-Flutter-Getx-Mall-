import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

// This is the Binding Class by Inderkant

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}
