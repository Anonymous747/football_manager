import 'dart:convert';

import 'package:football_manager/resourses/strings.dart';
import 'package:http/http.dart' as http;

import 'package:football_manager/models/past_matches_model.dart';

abstract class MatchesRepositories {
  Future<Data> getPastMatches();
}

class MatchesRepositoriesImpl implements MatchesRepositories {
  @override
  Future<Data> getPastMatches() async {
    var response = await http.get(PAST_MATCHES);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Data finalData = PastMatchesModel.fromJson(data).data;
      return finalData;
    } else {
      throw Exception();
    }
  }

}