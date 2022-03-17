import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_layout_controller.dart';
import 'package:udemy_flutter/models/category_model.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
        init: Get.find<ShopLayoutController>(),
        builder: (shopLayoutController) => ListView.separated(
            itemBuilder: (context, index) => buildCategoryItem(
                shopLayoutController
                    .categoriesModel!.data!.categoryList[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 4));
  }

  Widget buildCategoryItem(CategoryModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image.toString()),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 3,
              child: Text(
                model.name.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
      );
}
