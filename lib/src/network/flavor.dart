import 'dart:ui';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ocr_ovd_mobile/src/network/environment.dart';

class Flavor {
  static Future<Environment> getFlavor(String flavor) async {
    var data = await loadJsonFromAssets("assets/flavor.json");
    return Environment.fromJson(data[flavor]);
  }

  static Future<Map<String, dynamic>> loadJsonFromAssets(
      String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return json.decode(jsonString);
  }
}
