import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magazinez/models/category_model.dart';
import 'package:magazinez/screeens/categories_screen.dart';
import 'package:magazinez/screeens/drawer.dart';
import 'package:magazinez/screeens/news_tab.dart';
import 'package:magazinez/screeens/tab_controller.dart';
import '../shared/network/remote/api_manager.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories=CategoryModel.getCategories();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image:AssetImage ("assets/images/pattern.png"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        drawer:DrawerTab(onDrawerClicked),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: categoryModel==null?Text("News App",style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),):Text(categoryModel!.name,style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight:Radius.circular(18),
            )
          ),
        ),
        body:categoryModel==null? CategoriesTab(categories,onCategoryClicked):NewsTab(categoryModel!.id),
      ),
    );
  }

  CategoryModel? categoryModel=null;
  onCategoryClicked(category){
categoryModel=category;
setState(() {});
  }
  onDrawerClicked(id){
    if(id==DrawerTab.CAT_ID){
    categoryModel=null;
    }
    else if(id==DrawerTab.SET_ID){

    }
    setState(() {
      Navigator.pop(context);
    });
  }
}
