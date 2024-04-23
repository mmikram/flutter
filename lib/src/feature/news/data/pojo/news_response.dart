import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';
part 'news_response.freezed.dart';
part 'news_response.g.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
@freezed
class NewsResponse with _$NewsResponse{
  factory NewsResponse({
    required String status,
    required int totalResults,
    required List<News> articles,
})= _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

}