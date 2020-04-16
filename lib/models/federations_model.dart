class FederationsModel {
  bool success;
  Info info;

  FederationsModel({this.success, this.info});

  FederationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    info = json['data'] != null ? new Info.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> info = new Map<String, dynamic>();
    info['success'] = this.success;
    if (this.info != null) {
      info['data'] = this.info.toJson();
    }
    return info;
  }
}

class Info {
  List<Federation> federation;

  Info({this.federation});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['federation'] != null) {
      federation = new List<Federation>();
      json['federation'].forEach((v) {
        federation.add(new Federation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> info = new Map<String, dynamic>();
    if (this.federation != null) {
      info['federation'] = this.federation.map((v) => v.toJson()).toList();
    }
    return info;
  }
}

class Federation {
  String id;
  String name;

  Federation({this.id, this.name});

  Federation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> info = new Map<String, dynamic>();
    info['id'] = this.id;
    info['name'] = this.name;
    return info;
  }
}
