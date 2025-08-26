import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/ui/home/category_details/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepository newsRepository;
  NewsCubit({required this.newsRepository}) : super(NewsLoadingState());

  void getNews(String sourceId, String pageNumbers) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId, pageNumbers);
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}



/*

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response.sources!));
      }
    } on Exception catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

*/