import 'package:flutter/material.dart';

import '../models/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
  Sources sources;
  bool selected;

  SourceItem(this.sources, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.green,
          )),
      child: Text(
        sources.name ?? "",
        style: TextStyle(color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
