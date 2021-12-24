import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/favorites_model.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
      init: Get.find<ShopLayoutController>(),
      builder: (shopLayoutController) => Scaffold(
        appBar: AppBar(),
        body: shopLayoutController.isloadingfavorites == true
            ? Center(child: CircularProgressIndicator())
            : shopLayoutController
                        .favoritesmodel!.data!.ListOfFavoriteModel.length ==
                    0
                ? Center(child: Text("Favorite List is Empty"))
                : ListView.separated(
                    itemBuilder: (context, index) => buildFavoriteItem(
                        shopLayoutController
                            .favoritesmodel!.data!.ListOfFavoriteModel[index]),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: shopLayoutController
                        .favoritesmodel!.data!.ListOfFavoriteModel.length),
      ),
    );
  }

  Widget buildFavoriteItem(FavoriteModel model) => Container(
        padding: EdgeInsets.all(20),
        height: 120,
        child: GetBuilder<ShopLayoutController>(
          init: Get.find<ShopLayoutController>(),
          builder: (shopLayoutController) => Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    height: 120,
                    width: 120,
                    image: NetworkImage(model.productModel!.image.toString()),
                    fit: BoxFit.cover,
                  ),
                  if (model.productModel!.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.productModel!.name.toString(),
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          model.productModel!.price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: defaultColor,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.productModel!.discount != 0)
                          Text(
                            model.productModel!.old_price.toString(),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              shopLayoutController
                                  .changeFavorites(int.parse(
                                      model.productModel!.id.toString()))
                                  .then((value) {});
                              print("after change");

                              // print(model.id);
                            },
                            icon: shopLayoutController
                                        .favorites[model.productModel!.id] ==
                                    true
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                  )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
