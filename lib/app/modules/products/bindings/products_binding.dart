import 'package:get/get.dart';
import '../controllers/products_controller.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(() => ProductsController(), fenix: true);
  }
}
