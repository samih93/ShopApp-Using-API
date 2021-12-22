class CategoriesModel
{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String , dynamic> json)
  {
    status = json["status"];
    data = CategoriesDataModel.fromJson(json["data"]);
  }
}

class CategoriesDataModel
{
  int? current_page ;
  List<CategoryModel> categoryList = [];
  CategoriesDataModel.fromJson(Map<String , dynamic> json)
  {
    current_page = json["current_page"];
    json["data"].forEach((element)=>categoryList.add(CategoryModel.fromJson(element)));
  }
}

class CategoryModel
{
  int? id ;
  String? name;
  String? image;

  CategoryModel.fromJson(Map<String , dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }

}