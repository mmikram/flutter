import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ocr_ovd_mobile/src/basic/constants/constants.dart';
import 'package:ocr_ovd_mobile/src/basic/data_state.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';
import 'package:ocr_ovd_mobile/src/feature/news/domain/repository/news_repository.dart';
import 'package:ocr_ovd_mobile/src/network/rest_client.dart';

class NewsRepositoryImpl implements NewsRepository {

  final RestClient restClient;

  NewsRepositoryImpl(this.restClient);

   @override
  Future<DataState<List<News>>> getNews() async {
     try {
       final httpResponse = await restClient.getNews(
           apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);

       if (httpResponse.response.statusCode == HttpStatus.ok) {
         return DataSuccess(httpResponse.data.articles);
       } else {
         return DataFailed(DioError(
             error: httpResponse.response.statusMessage,
             response: httpResponse.response,
             type: DioErrorType.badResponse,
             requestOptions: httpResponse.response.requestOptions

         ));
       }
     }on DioError catch(e){
       return DataFailed(e);
     }
  }



}