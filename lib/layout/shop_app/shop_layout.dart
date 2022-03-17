import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/modules/shop_app/search/search_screen.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
      init: ShopLayoutController(),
      builder: (shopLayoutController) => Scaffold(
        appBar: AppBar(
          title: Text(
              shopLayoutController.titles[shopLayoutController.currentIndex]),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(ShopSearchScreen());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: shopLayoutController.screens[shopLayoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 30,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          onTap: (index) {
            shopLayoutController.onchangeIndex(index);
          },
          currentIndex: shopLayoutController.currentIndex,
          items: shopLayoutController.bottomItems,
        ),
      ),
    );
  }
}
