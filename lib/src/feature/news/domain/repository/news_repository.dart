 import 'package:ocr_ovd_mobile/src/basic/data_state.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';

abstract class NewsRepository {

 Future<DataState<List<News>>> getNews();

 }