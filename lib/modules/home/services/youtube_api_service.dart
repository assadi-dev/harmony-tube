import 'package:flutter/foundation.dart';

Future<List<String>> fetchYoutubeCategoriesCollections({
  String category = "all",
}) async {
  await Future.delayed(const Duration(milliseconds: 1500));
  debugPrint("Fetching categories for: $category");
  return [];
}
