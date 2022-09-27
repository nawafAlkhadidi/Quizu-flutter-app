import 'package:dio/dio.dart';
import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';
import 'package:quiz_u/models/login_model.dart';

class AuthServices {
// ////////////////! login ////////////////!
  static Future<LoginModel?> login({
    required String phone,
    required String otp,
  }) async {
    LoginModel? user;
    Response res = await DioHelper.post(
      endpoint: EndPoints.login,
      data: {"OTP": otp, "mobile": phone},
    );
    user = LoginModel.fromJson(res.data);
    if (res.statusCode == 201) {
      await Prefs.setData(key: "token", value: user.token);
      await Prefs.setData(key: "mobile", value: user.mobile);
    }

    return user;
  }

// ////////////////! Updete Name ////////////////!

  static Future<bool> updateName({
    required String name,
  }) async {
    final res = await DioHelper.postWithToken(
        endpoint: EndPoints.updeteName,
        data: {"name": name},
        token: Prefs.getData(key: "token"));
    if (res.data["success"] == true) {
      return true;
    }
    return false;
  }

  // ////////////////! checks Token ////////////////!

  static Future<bool> checksToken() async {
    final res = await DioHelper.getWithToken(
        endpoint: EndPoints.token, token: Prefs.getData(key: "token"));
    if (res.data["success"] == false) {
       await Prefs.removeData(key: "token");
    await Prefs.removeData(key: "mobile");
      return false;
    }

    return true;
  }
}
