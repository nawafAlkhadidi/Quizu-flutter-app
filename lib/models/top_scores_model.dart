class TopScoresModel {
  String? name;
  int? score;

  TopScoresModel({this.name, this.score});

  TopScoresModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
  
    data['score'] = score;
    return data;
  }
}
