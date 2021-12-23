import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Favorites")),
    );
  }

  Widget buildFavoriteItem() => Container(
    height: 120,
    child: Row(
      children: [

        Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                height: 120,
                width: 120,
                image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                fit: BoxFit.cover,
              ),
              if (1 != 0)
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
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Apple MacBook Pro Apple MacBook Pro",
                  style: TextStyle(fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 12,
                      color: defaultColor,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (1 != 0)
                    Text(
                      "25000",
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
