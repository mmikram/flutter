import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_ovd_mobile/src/basic/data_state.dart';
import 'package:ocr_ovd_mobile/src/feature/news/domain/repository/news_repository.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_event.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(const NewsLoading()) {
    on<GetNews>(onGetNews);
  }

  void onGetNews(GetNews event, Emitter<NewsState> emit) async {

    final dataState= await newsRepository.getNews();
    
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(NewsDone(dataState.data));
      
    }

    if (dataState is DataFailed) {
      emit(NewsError(dataState.error!));
    }
  }
}
