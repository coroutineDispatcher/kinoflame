import 'package:moviezz/model/movie.dart';
import 'package:moviezz/model/now_playing_response.dart';

const ApiBaseUrl = "https://api.themoviedb.org/3";
const ApiKeyKey = "?api_key=";
const ApiImageBaseUrl = "https://image.tmdb.org/t/p/w400/";
const NowPlayingEndpoint = "/movie/now_playing";

// Movie request types
const MovieRequestTypeNowPlaying = 0;

var moviesInitialData = NowPlayingResponse(
  results: [
    Movie(),
    Movie(),
    Movie(),
    Movie(),
    Movie(),
    Movie(),
    Movie()
  ]
);