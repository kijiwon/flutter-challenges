class MovieModel {
  final String title, id, poster_path;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        poster_path = json['poster_path'];
}
