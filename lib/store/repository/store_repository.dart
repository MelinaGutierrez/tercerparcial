import 'package:dio/dio.dart';
import 'package:flbloc_demo/store/store.dart';

class StoreRepository {
  final Dio _client = Dio(BaseOptions(
      baseUrl:
          'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc'));

  Future<List<Movie>> getProducts() async {
    final response = await _client.get('');
    return (response.data as List)
        .map((json) => Movie(
              id: json['id'],
              title: json['title'],
              poster_path: json['poster_path'],
            ))
        .toList();
  }
}
