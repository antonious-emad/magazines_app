import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String id;
  String image;
  Color  color;
  int index=0;
  CategoryModel(this.name, this.id, this.image, this.color,this.index);

  static List<CategoryModel>  getCategories(){
    return[
      CategoryModel("Sports", "sports", "assets/images/ball.png", Color(0xffC91C22),1),
      CategoryModel("Politics", "general","assets/images/Politics.png", Color(0xff003e90),4),
      CategoryModel("Health", "health","assets/images/health.png", Color(0x0ffED1E79),5),
      CategoryModel("Business", "business","assets/images/bussines.png", Color(0xffcf7e48),2),
      CategoryModel("Environment", "entertainment","assets/images/environment.png",Color(0xff4882cf),3),
      CategoryModel("Science", "science","assets/images/science.png", Color(0XFFF2D352),6),
      // CategoryModel("Technology", "technology","assets/images/environment.png", Colors.lightGreen,7),
    ];
  }
}