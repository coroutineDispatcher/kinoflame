import 'package:moviezz/model/people.dart';

class PeopleResponse {
  List<People> results;

  PeopleResponse({this.results});

  factory PeopleResponse.fromJson(Map<String, dynamic> json) {
    return PeopleResponse(
        results: json["results"] != null
            ? List<People>.from(json["results"].map((x) => People.fromJson(x)))
            : List<People>());
  }
}
