import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magazinez/models/NewsResponse.dart';

class NewsCardItem extends StatelessWidget {
  Articles articles;

  NewsCardItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        elevation: 12,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                fit: BoxFit.fill,
                height: 230,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // child: Image.network(articles.urlToImage??"",fit: BoxFit.fill,height:230 ,)
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
              child: Text(
                articles.title ?? "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
              child: Text(
                articles.description ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                      child: Text(articles.author ?? "",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                          maxLines: 1)),
                  Text(articles.publishedAt?.substring(0, 10) ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}