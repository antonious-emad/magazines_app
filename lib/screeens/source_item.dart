import 'package:flutter/material.dart';
import '../models/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
Sources source;
bool selected;
SourceItem(this.source,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical:6 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:selected? Colors.green: Colors.transparent,
        border: Border.all(
          color: selected?Colors.green : Colors.transparent,
        )
      ),
      child: Text(source.name??"",style: TextStyle(
        color: selected? Colors.white: Colors.green,
      ),),
    );
  }
}
