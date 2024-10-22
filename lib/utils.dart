import 'dart:convert';
import 'package:flutter/services.dart';

Future<List> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}
