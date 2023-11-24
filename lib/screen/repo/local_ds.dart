

import '../../models/NewsResponse.dart';
import '../../models/SourcesResponse.dart';
import 'home_repo.dart';

class LocalDataSource implements HomeRepo{
  @override
  Future<NewsResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String catId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}