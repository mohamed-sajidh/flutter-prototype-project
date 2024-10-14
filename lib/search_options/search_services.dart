import 'package:dio/dio.dart';

class SearchServices {
  Future<List<String>> fetchSearchSuggestions(String query) async {
    final dio = Dio();
    const String searchApiUrl = 'https://api.example.com/search';
    try {
      final response =
          await dio.get(searchApiUrl, queryParameters: {'query': query});
      return List<String>.from(response.data['suggestions']);
    } catch (error) {
      print('Error fetching search suggestions: $error');
      return [];
    }
  }
}
