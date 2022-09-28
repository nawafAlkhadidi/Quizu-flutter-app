import 'package:dio/dio.dart';
import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';
import 'package:quiz_u/models/login_model.dart';

class AuthServices {
// ////////////////! login ////////////////!
  static Future<Response> login({
    required String phone,
    required String otp,
  }) async {
    Response res = await DioHelper.post(
      endpoint: EndPoints.login,
      data: {"OTP": otp, "mobile": phone},
    );
    return res;
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
      await Prefs.setData(key: "mobile", value: res.data["mobile"]);
      return true;
    }
    return false;
  }

  // ////////////////! checks Token ////////////////!

  static Future<bool> checksToken() async {
    final res = await DioHelper.getWithToken(
        endpoint: EndPoints.token, token: Prefs.getData(key: "token") ?? "");
    if (res.data["success"] == false) {
      await Prefs.removeData(key: "token");
      await Prefs.removeData(key: "mobile");
      return false;
    }
    return true;
  }
}
