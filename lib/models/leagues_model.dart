class LeaguesModel {
  bool success;
  Leagues leagues;

  LeaguesModel({this.success, this.leagues});

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    leagues = json['data'] != null ? new Leagues.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.leagues != null) {
      data['data'] = this.leagues.toJson();
    }
    return data;
  }
}

class Leagues {
  List<League> leagues;

  Leagues({this.leagues});

  Leagues.fromJson(Map<String, dynamic> json) {
    if (json['league'] != null) {
      leagues = new List<League>();
      json['league'].forEach((v) {
        leagues.add(new League.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['league'] = this.leagues.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  String id;
  String name;
  String countryId;
  String scores;

  League({this.id, this.name, this.countryId, this.scores});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    scores = json['scores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['scores'] = this.scores;
    return data;
  }
}

