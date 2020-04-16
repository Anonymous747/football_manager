import 'dart:convert';

import 'package:football_manager/models/federations_model.dart';
import 'package:football_manager/resourses/strings.dart';
import 'package:http/http.dart' as http;

import 'package:football_manager/models/past_matches_model.dart';

abstract class MatchRepositories {
  Future<Data> getPastMatches();
  Future<Info> getFederations();

}

class MatchRepositoriesImpl implements MatchRepositories {
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

  @override
  Future<Info> getFederations() async {
    var response = await http.get(FEDERATIONS);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Info finalData = FederationsModel.fromJson(data).info;
      return finalData;
    } else {
      throw Exception();
    }
  }

}