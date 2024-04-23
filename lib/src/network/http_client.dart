import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ocr_ovd_mobile/src/network/environment.dart';

class DataClient {
  Dio? dio;
  static DataClient? _inst;

  DataClient._internal(String baseUrl, Map<String, String?> map) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 30000),
        headers: map,
      ),
    );
    //Todo Enable SSL
   // getInitialise(baseUrl, map);
  }

 static Dio? buildDioClient(String? baseUrl, Map<String, String?> map) {
    _inst ??= DataClient._internal(baseUrl!, map);
   // CustomLogger.log("re-paint");
    if (_inst != null && _inst!.dio != null) {
      _inst!.dio!.options.baseUrl = baseUrl!;
      _inst!.dio!.options.headers = map;
    }
    return _inst!.dio;
  }

  Future<void> getInitialise(String baseUrl, Map<String, String?> map) async {
    try {
      //String data = await rootBundle.loadString("assets/star_fullertonindia_com.cer");
      dio?.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        return HttpClient()
          ..badCertificateCallback =
              ((X509Certificate cert, String baseUrl, int port) => true);
      });
    } on Exception catch (e) {
     // CustomLogger.handleException("SecurityContext ", e);
    }
  }

  static Dio? getDioClient(Environment environment){
    final dioClient= DataClient.buildDioClient(environment.baseUrl, {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
      ''
    });
    return dioClient;
  }

/*Future<void> getInitialise(String baseUrl, Map<String, String> map) async {
    try {
      String data = await rootBundle.loadString("assets/star_fullertonindia_com.cer");
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        SecurityContext scContext =
            new SecurityContext(withTrustedRoots: false);
        List bytes = utf8.encode(data);
        scContext.setTrustedCertificatesBytes(bytes);
        return new HttpClient(context: scContext);
      };
    } on Exception catch (e) {
      CustomLogger.handleException("SecurityContext ",e);
    }
  }*/
}
