import 'package:moviezz/model/movie.dart';
import 'package:moviezz/model/movie_response.dart';
import 'package:moviezz/model/tv_response.dart';
import 'package:moviezz/model/tv_show.dart';

const ApiBaseUrl = "https://api.themoviedb.org/3";
const ApiKeyKey = "?api_key=";
const ApiImageBaseUrl = "https://image.tmdb.org/t/p/w400";
const NowPlayingEndpoint = "/movie/now_playing";
const UpcommingEndpoint = "/movie/upcoming";
const PopularEndpoint = "/movie/popular";
const TopRatedEndpoint = "/movie/top_rated";
const TvShowArrivingTodayEndpoint = "/tv/airing_today";
const TvShowOnTheAirEndpoint = "/tv/on_the_air";
const TvShowPopularEndpoint = "/tv/popular";
const TvShowTopRatedEndpoint = "/tv/top_rated";

// Movie request types
const MovieRequestTypeNowPlaying = 0;

var moviesInitialData = MovieResponse(
    results: [Movie(), Movie(), Movie(), Movie(), Movie(), Movie(), Movie()]);

var tvShowsInitialData = TvResponse(
    results: [TvShow(), TvShow(), TvShow(), TvShow(), TvShow(), TvShow()]);
