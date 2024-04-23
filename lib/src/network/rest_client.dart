import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news_response.dart';
import 'package:ocr_ovd_mobile/src/network/environment.dart';
import 'package:ocr_ovd_mobile/src/router/injection.dart';
import 'package:retrofit/retrofit.dart';

import '../basic/constants/constants.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/top-headlines")
  Future<HttpResponse<NewsResponse>> getNews({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
