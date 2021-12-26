import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/modules/shop_app/favorites/favorite_screen.dart';
import 'package:udemy_flutter/modules/shop_app/settings/update_profile.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  final double coverHeight = 200;
  final double profileHeight = 100;
  final double topContainer = 70;
  final double containerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverConatiner(),
                Positioned(
                    child: buildProfileContainer(context), top: topContainer),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Get.to(UpdateProfile());
                      },
                      icon: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey.shade700,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Get.to(FavoritesScreen());
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Colors.grey.shade700,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.grey.shade700,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        print("hello signout ");
                        signOut();
                      },
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 40,
                        color: Colors.red.shade400,
                      )),
                ),
              ],
            ),
            // Container(
            //   color: Colors.red,
            //   height: 300,
            //   child: Column(
            //     children: [
            //       defaultButton(
            //           text: "Sign Out",
            //           onpress: () {
            //             print("hello sign out ");
            //           })
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCoverConatiner() => Container(
        height: 200,
        color: defaultColor,
      );

  Widget buildProfileContainer(BuildContext context) =>
      GetBuilder<ShopLayoutController>(
        init: Get.find<ShopLayoutController>(),
        builder: (shopLayoutController) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            shopLayoutController.shopLoginModel!.userData!.name
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            shopLayoutController.shopLoginModel!.userData!.email
                                .toString(),
                            style:
                                TextStyle(color: Colors.grey, letterSpacing: 1),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              shopLayoutController
                                  .shopLoginModel!.userData!.phone
                                  .toString(),
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: containerHeight - profileHeight / 2,
                  child: CircleAvatar(
                    radius: profileHeight / 2,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/a-/AOh14GgzR_P3O_71eptoflnQWXvVAidn3BTVooIABjTakQ=s288-p-rw-no"),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
