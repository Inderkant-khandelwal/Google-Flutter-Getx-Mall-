import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthCustom = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF354557),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.localProductList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.localProductList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 150,
                            width: widthCustom / 100 * 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .localProductList[index]["pro_img"]
                                          .toString()),
                                      fit: BoxFit.contain),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)),
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 150,
                            width: widthCustom / 100 * 60,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // Product Heading
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        controller.localProductList[index]
                                                ["pro_name"]
                                            .toString()
                                            .substring(
                                                0,
                                                controller.localProductList[
                                                                index]
                                                                ["pro_name"]
                                                            .toString()
                                                            .length >
                                                        13
                                                    ? 13
                                                    : controller
                                                        .localProductList[index]
                                                            ["pro_name"]
                                                        .toString()
                                                        .length),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            controller.deleteProduct(controller
                                                    .localProductList[index]
                                                ["pid"]);
                                          },
                                          icon: const Icon(Icons.delete,
                                              size: 20)),
                                    ],
                                  ),

                                  // price

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Price",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "${controller.localProductList[index]["pro_price"]}/-",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),

                                  // quantity

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Quantity",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0XFF354557),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total Items : ${controller.localProductList.length}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text(
                "Total Items : ${controller.productsSum().toString()} /-",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
