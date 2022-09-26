class QuestionModel {
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? correct;

  QuestionModel({this.question, this.a, this.b, this.c, this.d, this.correct});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question'] = question;
    data['a'] = a;
    data['b'] = b;
    data['c'] = c;
    data['d'] = d;
    data['correct'] = correct;
    return data;
  }
}