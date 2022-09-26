class LoginModel {
  bool? success;
  String? message;
  String? token;
  String? name;
  String? mobile;

  LoginModel({this.success, this.message, this.token, this.name, this.mobile});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    data['name'] = name;
    data['mobile'] = mobile;
    return data;
  }
}
