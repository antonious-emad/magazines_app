import 'package:flutter/material.dart';
import 'package:magazinez/models/SourcesResponse.dart';
import 'package:magazinez/screeens/news_card_item.dart';
import 'package:magazinez/screeens/source_item.dart';
import 'package:magazinez/shared/network/remote/api_manager.dart';

class TabControllerWidget extends StatefulWidget {
  List<Sources> sources;

  TabControllerWidget(this.sources);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                        child: SourceItem(source,
                            widget.sources.indexOf(source) == selectedIndex),
                      ))
                  .toList(),
            )
        ),
        FutureBuilder(
            future: ApiManager.getNewsData(widget.sources[selectedIndex].id??""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }

              var newsList=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsCardItem(newsList[index]);
                    // Text(newsList[index].title??"");
                },itemCount: newsList.length,),
              );
            },)
      ],
    );
  }
}
