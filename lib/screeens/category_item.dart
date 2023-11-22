import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magazinez/models/category_model.dart';

class CategoryItem extends StatelessWidget {
CategoryModel categoryModel;

CategoryItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topRight:Radius.circular(25) ,
            bottomRight:categoryModel.index.isEven? Radius.circular(0):Radius.circular(25) ,
            topLeft: Radius.circular(25),
            bottomLeft:categoryModel.index.isOdd? Radius.circular(0):Radius.circular(25) ,
          )
        ),
        child:
        Column(
          children: [
            Expanded(child: Image.asset(categoryModel.image)),
            Text(categoryModel.name,style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
