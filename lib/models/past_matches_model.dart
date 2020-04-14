class PastMatchesModel {
  bool success;
  Data data;

  PastMatchesModel({this.success, this.data});

  PastMatchesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Match> match;
  String nextPage;
  bool prevPage;

  Data({this.match, this.nextPage, this.prevPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['match'] != null) {
      match = new List<Match>();
      json['match'].forEach((v) {
        match.add(new Match.fromJson(v));
      });
    }
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.match != null) {
      data['match'] = this.match.map((v) => v.toJson()).toList();
    }
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    return data;
  }
}

class Match {
  String id;
  String date;
  String homeName;
  String awayName;
  String score;
  String htScore;
  String ftScore;
  String etScore;
  String time;
  String leagueId;
  String status;
  String added;
  String lastChanged;
  String homeId;
  String awayId;
  String competitionId;
  //Null location;
  //Null fixtureId;
  //Null scheduled;
  String competitionName;
  Outcomes outcomes;

  Match(
      {this.id,
      this.date,
      this.homeName,
      this.awayName,
      this.score,
      this.htScore,
      this.ftScore,
      this.etScore,
      this.time,
      this.leagueId,
      this.status,
      this.added,
      this.lastChanged,
      this.homeId,
      this.awayId,
      this.competitionId,
      //this.location,
      //this.fixtureId,
      //this.scheduled,
      this.competitionName,
      this.outcomes});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    homeName = json['home_name'];
    awayName = json['away_name'];
    score = json['score'];
    htScore = json['ht_score'];
    ftScore = json['ft_score'];
    etScore = json['et_score'];
    time = json['time'];
    leagueId = json['league_id'];
    status = json['status'];
    added = json['added'];
    lastChanged = json['last_changed'];
    homeId = json['home_id'];
    awayId = json['away_id'];
    competitionId = json['competition_id'];
    //location = json['location'];
    //fixtureId = json['fixture_id'];
    //scheduled = json['scheduled'];
    competitionName = json['competition_name'];
    outcomes = json['outcomes'] != null
        ? new Outcomes.fromJson(json['outcomes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['home_name'] = this.homeName;
    data['away_name'] = this.awayName;
    data['score'] = this.score;
    data['ht_score'] = this.htScore;
    data['ft_score'] = this.ftScore;
    data['et_score'] = this.etScore;
    data['time'] = this.time;
    data['league_id'] = this.leagueId;
    data['status'] = this.status;
    data['added'] = this.added;
    data['last_changed'] = this.lastChanged;
    data['home_id'] = this.homeId;
    data['away_id'] = this.awayId;
    data['competition_id'] = this.competitionId;
    //data['location'] = this.location;
    //data['fixture_id'] = this.fixtureId;
    //data['scheduled'] = this.scheduled;
    data['competition_name'] = this.competitionName;
    if (this.outcomes != null) {
      data['outcomes'] = this.outcomes.toJson();
    }
    return data;
  }
}

class Outcomes {
  String halfTime;
  //Null fullTime;
  String extraTime;

  Outcomes({this.halfTime, this.extraTime});

  Outcomes.fromJson(Map<String, dynamic> json) {
    halfTime = json['half_time'];
    //fullTime = json['full_time'];
    extraTime = json['extra_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['half_time'] = this.halfTime;
    //data['full_time'] = this.fullTime;
    data['extra_time'] = this.extraTime;
    return data;
  }
}
