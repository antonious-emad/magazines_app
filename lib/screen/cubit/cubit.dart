import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:magazinez/screen/cubit/states.dart';


import '../../models/NewsResponse.dart';
import '../../models/SourcesResponse.dart';
import '../repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Sources> sourcesList = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  changeSource(int value) {
    selectedIndex = value;
    emit(HomeChangeSourceState());
  }

  Future<void> getSources(String catId) async {
    emit(HomeGetSourcesLoadingState());
    try {
      SourcesResponse sourcesResponse = await repo.getSources(catId);
      sourcesList = sourcesResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
      throw Exception();
    }
  }

  Future<void> getNewsData() async {
    emit(HomeGetNewsDataLoadingState());
    try {
      articles = (await repo.getNewsData(sourcesList[selectedIndex].id ?? ""))
              .articles ??
          [];
      emit(HomeGetNewsDataSuccessState());
    } catch (e) {
      emit(HomeGetNewsDataErrorState());
    }
  }
}
