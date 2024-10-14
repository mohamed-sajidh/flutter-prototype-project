import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:testing_widgets/searchbar/movie_details_model.dart';
import 'package:testing_widgets/searchbar/movie_recomentation_model.dart';
import 'package:testing_widgets/searchbar/search_model.dart';

const apiKey = "d761933ff4739ed9a8080484e3476307";
const baseUrl = "https://api.themoviedb.org/3/";
const key = "?api_key=$apiKey";
late String endPoint;
const apiAuthorizationToken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzYxOTMzZmY0NzM5ZWQ5YTgwODA0ODRlMzQ3NjMwNyIsIm5iZiI6MTcyNjI5NzI3OC44MDE5MjcsInN1YiI6IjY2ZTMwNmZmMjgwNDhkOTJkZWY5MDg1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WG3YQ1d_sFztC4EytPDnEvHKhjgSg1bzWKvKQw0PGHY";

class ApiServices {
  Future<SearchModel> getSarchedMovies(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    print("Search url is $url");

    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': "Bearer $apiAuthorizationToken"});

    if (response.statusCode == 200) {
      log("search success");
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load searched movie");
    }
  }

  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("Movie Recommendations success");

      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load movie recommendations");
    }
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("Movie Details fetch Success");
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load movie-detail");
    }
  }

  Future<MovieRecommendationModel> getMovieRecomentation(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url)); 

    if(response.statusCode == 200) {
      log("Movie Recomentaions fetch Success"); 
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load more movies like this!!!");
    }
  }
}
