import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState<T> extends Equatable {
  final T? newses;
  final DioError? error;

  const NewsState({this.newses, this.error});

  @override
  List<Object?> get props => [newses!, error!];
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsDone<T> extends NewsState {
  const NewsDone(T news) : super(newses: news);
}

class NewsError extends NewsState {
  const NewsError(DioError error) : super(error: error);
}
