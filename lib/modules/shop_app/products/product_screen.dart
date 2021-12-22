import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
      init: Get.find<ShopLayoutController>(),
      builder: (shopLayoutController) => Scaffold(
        appBar: AppBar(),
        body: shopLayoutController.isloadinghome
            ? Center(child: CircularProgressIndicator())
            : productsBuilder(shopLayoutController.homeModel),
      ),
    );
  }

  Widget productsBuilder(HomeModel? model) => Column(
        children: [
          CarouselSlider(
            items: model!.data!.banners
                .map((element) => Image(
                      image: NetworkImage(element.image.toString()),
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          )
        ],
      );
}
