import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/category_model.dart';
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
        body: shopLayoutController.isloadinghome && shopLayoutController.isloadingcategories
            ? Center(child: CircularProgressIndicator())
            : productsBuilder(shopLayoutController.homeModel , shopLayoutController.categoriesModel),
      ),
    );
  }

  Widget productsBuilder(HomeModel? homemodel,CategoriesModel? categoriesModel) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: homemodel!.data!.banners
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,

                children: [
                  Text("Categories",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Container(height: 100, child: ListView.separated(physics: BouncingScrollPhysics(),scrollDirection: Axis.horizontal, itemBuilder: (context,index)=>buildCategoryItem(categoriesModel!.data!.categoryList[index]), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount: categoriesModel!.data!.categoryList.length)),
                  SizedBox(height: 20,),

                  Text("Products",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            Container(
              color: Colors.grey.shade300,
              child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1 / 1.66,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      homemodel.data!.products.length,
                      (index) =>
                          buildGridProduct(homemodel.data!.products[index]))),
            )
          ],
        ),
      );

  Widget buildCategoryItem(CategoryModel model) =>  Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image: NetworkImage(model.image.toString()),width: 100,height: 100,fit: BoxFit.cover,),
      Container(
          width: 100,
          color: Colors.black.withOpacity(0.8),
          child: Text(model.name.toString(),style: TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,)),
    ],
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
                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                    color: Colors.red,
                    child: Text(
                      "DISCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,

                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                      Spacer(),
                      IconButton( padding: EdgeInsets.zero,onPressed: (){}, icon: Icon(Icons.favorite,size: 20,)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
