import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category_model.dart';
import '../screen/categories_tab.dart';
import '../screen/drawer.dart';
import '../screen/news_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> catories = CategoryModel.getCategories();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          drawer: DrawerTab(onDrawerClicked),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            title: categoryModel==null?Text("News App",style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),):Text(categoryModel!.name,style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),

          ),
          body: categoryModel == null
              ? CategoriesTab(catories, onCategoryClicked)
              : NewsTab(categoryModel!.id)),
    );
  }

  CategoryModel? categoryModel = null;

  onCategoryClicked(category) {
    categoryModel = category;
    setState(() {});
  }

  onDrawerClicked(id) {
    if (id == DrawerTab.CAT_ID) {
      categoryModel = null;
    } else if (id == DrawerTab.SET_ID) {}
    setState(() {
      Navigator.pop(context);
    });
  }
}
