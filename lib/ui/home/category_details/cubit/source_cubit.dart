import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';
import 'package:news_app/ui/home/category_details/cubit/source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourcesRepository sourcesRepository;

  SourceCubit({required this.sourcesRepository}) : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourcesRepository.getSources(categoryId);
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
}
