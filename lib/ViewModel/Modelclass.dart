import 'package:flutter/foundation.dart';

class BannerCat{
  List<Category> category;
  List<String> banners;


  BannerCat({required this.category, required this.banners});

}


class Category{
  int id;
  String title;

  Category({required this.id,required this.title});

  factory Category.fromjson(Map<String,dynamic> map)
  {
    return Category(id: map['id']
        ,title : map['title']);

  }

}