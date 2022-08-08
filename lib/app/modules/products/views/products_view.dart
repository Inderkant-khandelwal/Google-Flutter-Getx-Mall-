import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manek_test/app/modules/cart/controllers/cart_controller.dart';
import '../controllers/products_controller.dart';

// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

// ignore: must_be_immutable
class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthCustom = MediaQuery.of(context).size.width;
    final heightCustom = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: const Color(0XFF354557),
          title: const Text('Getx Mall (Inderkant) '),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed("/cart");
                    },
                    icon: const Icon(Icons.shopping_cart)),
                Positioned(
                    top: 0.0,
                    right: 7.0,
                    child: Obx(
                      () => CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                          child: Text(Get.find<CartController>()
                              .getTotalItemsInCart()
                              .toString())),
                    ))
              ],
            )
          ],
          centerTitle: true,
        ),
        drawer: inderkantDrawer(),
        body: Obx(
          () => controller.productList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  itemCount: controller.productList[0].data?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: context.isPortrait
                        ? 2
                        : widthCustom / (heightCustom / 100 * 80),
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio:
                                      widthCustom / (heightCustom / 100 * 55),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(controller
                                                .productList[0]
                                                .data![index]
                                                .featuredImage
                                                .toString()))),
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio:
                                      (widthCustom / (heightCustom / 100 * 15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            controller.productList[0]
                                                .data![index].slug
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () {
                                              controller.addProductToSqflite(
                                                  controller.productList[0]
                                                      .data![index].slug,
                                                  controller.productList[0]
                                                      .data![index].price,
                                                  controller
                                                      .productList[0]
                                                      .data![index]
                                                      .featuredImage
                                                      .toString());

                                              Get.find<CartController>()
                                                  .fetchSqfDbProduct();
                                            },
                                            icon: const Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }

  // making drawer

  Drawer inderkantDrawer() {
    return Drawer(
      elevation: 10.0,
      backgroundColor: const Color(0XFF354557),
      child: SafeArea(
        child: SingleChildScrollView(
          // main container
          // ignore: avoid_unnecessary_containers
          child: Container(
            // main column
            child: Column(
              children: [
                // pic and meta data container
                Container(
                  width: 304,
                  color: const Color(0XFF354557).withOpacity(0.1),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://cdn2.iconfinder.com/data/icons/cute-people-avatars/1500/Avatars_face_7-512.png"))),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 150,
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: Column(
                            children: [
                              // welcome row
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text("Welcome",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),

                              // user name

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("Inderkant",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 19,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 100,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Matter container
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // Home Tile
                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      title: Text("Home",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      selected: true,
                      selectedTileColor:
                          const Color(0XFF354557).withOpacity(0.2),
                    ),

                    // copyright

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.copyright,
                        color: Colors.orange,
                      ),
                      title: Text("Report Copyright",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    // profile setting

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      title: Text("Manage Profile",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    // App Setting

                    ExpansionTile(
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.deepOrange,
                      leading: const Icon(Icons.app_settings_alt,
                          color: Colors.blue),
                      title: Text("App Setting",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.color_lens,
                            color: Colors.red.withOpacity(0.7),
                          ),
                          title: Text("Color Setting",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_right,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.font_download,
                            color: Colors.red.withOpacity(0.7),
                          ),
                          title: Text("Font Setting",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_right,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),

                    //
                    Divider(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    // path start

                    Divider(
                      color: Colors.white.withOpacity(0.2),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.group_work_rounded,
                        color: Colors.blue,
                      ),
                      title: Text("Supporters",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    Divider(
                      color: Colors.white.withOpacity(0.2),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.policy_outlined,
                        color: Colors.blue,
                      ),
                      title: Text("Privacy Policy",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.question_answer,
                        color: Colors.blue,
                      ),
                      title: Text("FAQ's",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    Divider(
                      color: Colors.white.withOpacity(0.2),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.question_mark,
                        color: Colors.blue,
                      ),
                      title: Text("Help and Feedback",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.logout_sharp,
                        color: Colors.blue,
                      ),
                      title: Text("Logout",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.offline_bolt,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      selected: true,
                      selectedTileColor:
                          const Color(0XFF354557).withOpacity(0.05),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
