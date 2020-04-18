class ResultsModel {
  bool success;
  Results results;

  ResultsModel({this.success, this.results});

  ResultsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results = json['data'] != null ? new Results.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.results != null) {
      data['data'] = this.results.toJson();
    }
    return data;
  }
}

class Results {
  List<Table> table;

  Results({this.table});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['table'] != null) {
      table = new List<Table>();
      json['table'].forEach((v) {
        table.add(new Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['table'] = this.table.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  String leagueId;
  String seasonId;
  String name;
  String rank;
  String points;
  String matches;
  String goalDiff;
  String goalsScored;
  String goalsConceded;
  String lost;
  String drawn;
  String won;
  String teamId;
  String competitionId;

  Table(
      {this.leagueId,
      this.seasonId,
      this.name,
      this.rank,
      this.points,
      this.matches,
      this.goalDiff,
      this.goalsScored,
      this.goalsConceded,
      this.lost,
      this.drawn,
      this.won,
      this.teamId,
      this.competitionId});

  Table.fromJson(Map<String, dynamic> json) {
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    name = json['name'];
    rank = json['rank'];
    points = json['points'];
    matches = json['matches'];
    goalDiff = json['goal_diff'];
    goalsScored = json['goals_scored'];
    goalsConceded = json['goals_conceded'];
    lost = json['lost'];
    drawn = json['drawn'];
    won = json['won'];
    teamId = json['team_id'];
    competitionId = json['competition_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['league_id'] = this.leagueId;
    data['season_id'] = this.seasonId;
    data['name'] = this.name;
    data['rank'] = this.rank;
    data['points'] = this.points;
    data['matches'] = this.matches;
    data['goal_diff'] = this.goalDiff;
    data['goals_scored'] = this.goalsScored;
    data['goals_conceded'] = this.goalsConceded;
    data['lost'] = this.lost;
    data['drawn'] = this.drawn;
    data['won'] = this.won;
    data['team_id'] = this.teamId;
    data['competition_id'] = this.competitionId;
    return data;
  }
}
