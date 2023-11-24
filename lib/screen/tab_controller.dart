import 'package:flutter/material.dart';
import 'package:magazinez/screen/source_item.dart';


import 'cubit/cubit.dart';
import 'news_card_item.dart';

class TabControllerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: HomeCubit.get(context).sourcesList.length,
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                HomeCubit.get(context).changeSource(index);
              },
              indicatorColor: Colors.transparent,
              tabs: HomeCubit.get(context)
                  .sourcesList
                  .map((source) => Tab(
                        child: SourceItem(
                            source,
                            HomeCubit.get(context)
                                    .sourcesList
                                    .indexOf(source) ==
                                HomeCubit.get(context).selectedIndex),
                      ))
                  .toList(),
            )),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsCardItem(HomeCubit.get(context).articles[index]);
            },
            itemCount: HomeCubit.get(context).articles.length,
          ),
        )
      ],
    );
  }
}
