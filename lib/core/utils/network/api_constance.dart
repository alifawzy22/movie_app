class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const apiKey = 'c3435cfe40aeb079689227d82bf921d3';

  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String detailsMoviePath({required int movieId}) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationMoviePath({required int movieId}) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl({required String path}) => '$baseImageUrl$path';
}
