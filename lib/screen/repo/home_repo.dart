

import '../../models/NewsResponse.dart';
import '../../models/SourcesResponse.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String catId);

  Future<NewsResponse> getNewsData(String sourceId);
}
