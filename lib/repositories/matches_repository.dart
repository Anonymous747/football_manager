import 'dart:convert';

import 'package:football_manager/models/cups_model.dart';
import 'package:football_manager/models/federations_model.dart';
import 'package:football_manager/models/leagues_model.dart';
import 'package:football_manager/models/results.dart';
import 'package:football_manager/resourses/strings.dart';
import 'package:http/http.dart' as http;

import 'package:football_manager/models/past_matches_model.dart';

abstract class MatchRepositories {
  Future<Data> getPastMatches();
  Future<Info> getFederations();
  Future<Cup> getCups(String cupName);
  Future<Leagues> getLeagues(String leaguesName);
  Future<Results> getResults(String resultName);

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

  @override
  Future<Cup> getCups(String cupName) async {
    var response = await http.get(CUPS + "&name=$cupName");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Cup cups = CupsModel.fromJson(data).cup;
      return cups;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Leagues> getLeagues(String leaguesName) async {
    var response = await http.get(LEAGUES + "&name=$leaguesName");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Leagues leagues = LeaguesModel.fromJson(data).leagues;
      return leagues;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Results> getResults(String resultName) async {
    var response = await http.get(RESULTS + "&competition_id=$resultName");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Results results = ResultsModel.fromJson(data).results;
      return results;
    } else {
      throw Exception();
    }
  }

}