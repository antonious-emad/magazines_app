import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  DrawerTab(this.onClick,{super.key});
  static int CAT_ID=1;
  static int SET_ID=2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width*0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: Center(child: Text("News App!",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white))),
            ),
            InkWell(
              onTap: () {
                onClick(CAT_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Icon(Icons.list,color: Color(0xff303030,),size: 45),
                    SizedBox(width: 10,),
                    Text("Categories",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 24,color:Color(0xff303030,)),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onClick(SET_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Icon(Icons.settings,color:Color(0xff303030,),size: 45),
                    SizedBox(width: 10,),
                    Text("Settings",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 24,color:Color(0xff303030,)),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}