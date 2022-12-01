import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/movie_detail_model.dart';
import 'package:ditonton/data/models/movie_model.dart';
import 'package:ditonton/data/models/movie_response.dart';
import 'package:ditonton/data/models/trailer_response.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> getUpcomingMovies();
  Future<TrailerResponse> getMovieTrailer(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

/// Get raw JSON from API, return model of JSON
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const API_KEY = 'api_key=acac9a96a1888da7d39bf69a8c3a51d6';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  /// Get raw JSON from API, return model of object
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  /// Call [MovieDetailModel] from data/models/movie_detail_model
  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TrailerResponse> getMovieTrailer(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id/videos?$API_KEY'));

    if (response.statusCode == 200) {
      return TrailerResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  /// Get raw JSON from API, return model of object
  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  /// Get raw JSON from API, return model of object
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  /// Get raw JSON from API, return model of object
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/upcoming?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  /// Get raw JSON from API, return model of object
  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
