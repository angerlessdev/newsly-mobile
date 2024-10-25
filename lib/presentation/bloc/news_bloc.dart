import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/data/remote/news_service.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/bloc/news_event.dart';
import 'package:newsly/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<SearchNewsEvents>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          List<News> news = await NewsService().searchNews(event.query);
          emit(NewsLoadedState(news: news));
        } catch (error) {
          emit(NewsErrorState(errorMessage: error.toString()));
        }
      },
    );
  }
}
