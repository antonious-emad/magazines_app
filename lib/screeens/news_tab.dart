import 'package:flutter/material.dart';
import 'package:magazinez/screeens/tab_controller.dart';
import '../shared/network/remote/api_manager.dart';

class NewsTab extends StatelessWidget {
  String catId;

  NewsTab(this.catId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(catId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        var sources = snapshot.data?.sources ?? [];
        return TabControllerWidget(sources);
        //   ListView.builder(
        //   itemBuilder: (context, index) {
        //     return Text(sources[index].name ?? "");
        //   },
        //   itemCount: sources.length,
        // );
      },
    );
  }
}
