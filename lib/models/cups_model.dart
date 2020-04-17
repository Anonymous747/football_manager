class CupsModel {
  bool success;
  Cup cup;

  CupsModel({this.success, this.cup});

  CupsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    cup = json['data'] != null ? new Cup.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cup = new Map<String, dynamic>();
    cup['success'] = this.success;
    if (this.cup != null) {
      cup['data'] = this.cup.toJson();
    }
    return cup;
  }
}

class Cup {
  List<Competition> competition;

  Cup({this.competition});

  Cup.fromJson(Map<String, dynamic> json) {
    if (json['competition'] != null) {
      competition = new List<Competition>();
      json['competition'].forEach((v) {
        competition.add(new Competition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cup = new Map<String, dynamic>();
    if (this.competition != null) {
      cup['competition'] = this.competition.map((v) => v.toJson()).toList();
    }
    return cup;
  }
}

class Competition {
  String id;
  String name;
  String isLeague;
  String isCup;
  String tier;
  String hasGroups;
  String active;
  List<Countries> countries;
  List<Federations> federations;

  Competition(
      {this.id,
      this.name,
      this.isLeague,
      this.isCup,
      this.tier,
      this.hasGroups,
      this.active,
      this.countries,
      this.federations});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isLeague = json['is_league'];
    isCup = json['is_cup'];
    tier = json['tier'];
    hasGroups = json['has_groups'];
    active = json['active'];
    if (json['countries'] != null) {
      countries = new List<Countries>();
      json['countries'].forEach((v) {
        countries.add(new Countries.fromJson(v));
      });
    }
    if (json['federations'] != null) {
      federations = new List<Federations>();
      json['federations'].forEach((v) {
        federations.add(new Federations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cup = new Map<String, dynamic>();
    cup['id'] = this.id;
    cup['name'] = this.name;
    cup['is_league'] = this.isLeague;
    cup['is_cup'] = this.isCup;
    cup['tier'] = this.tier;
    cup['has_groups'] = this.hasGroups;
    cup['active'] = this.active;
    if (this.countries != null) {
      cup['countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    if (this.federations != null) {
      cup['federations'] = this.federations.map((v) => v.toJson()).toList();
    }
    return cup;
  }
}

class Countries {
  String id;
  String name;
  String flag;

  Countries({this.id, this.name, this.flag});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['flag'] = this.flag;
    return data;
  }
}

class Federations {
  String id;
  String name;

  Federations({this.id, this.name});

  Federations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
