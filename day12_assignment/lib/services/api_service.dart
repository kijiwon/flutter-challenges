import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  final String popular = "popular";
  final String nowPlaying = 'now-playing';
  final String comingSoon = 'coming-soon';

  void getPopularMovies() async {
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }

  void getNowPlayingMovies() async {
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }

  void getComingSoonMovies() async {
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
