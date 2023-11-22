import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:magazinez/models/NewsResponse.dart';
import 'package:magazinez/shared/components/constants.dart';
import '../../../models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String catID) async {
    Uri url =
        Uri.https(BASE_URL, "/v2/top-headlines/sources", {"apiKey": API_KEY,"category":catID});
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonData);
    return data;
  }

  static Future<NewsResponse> getNewsData(String sourceID) async {
    Uri url = Uri.https(BASE_URL, "/v2/everything", {
      "apiKey": API_KEY,
      "sources":sourceID
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
    return newsResponse;
  }
}
