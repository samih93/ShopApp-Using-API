import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

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

  Widget productsBuilder(HomeModel? model) => SingleChildScrollView(
        child: Column(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.shade300,
              child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1 / 1.4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      model.data!.products.length,
                      (index) =>
                          buildGridProduct(model.data!.products[index]))),
            )
          ],
        ),
      );

  Widget buildGridProduct(ProductModel model) => Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  height: 200,
                  image: NetworkImage(model.image.toString()),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (model.discount != 0)
                  Container(
                    child: Text(
                      "DISCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.red,
                        fontSize: 8,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name.toString(),
                      style: TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: defaultColor,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          model.old_price.toString(),
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
