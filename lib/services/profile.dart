import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';
import 'package:quiz_u/models/user_model.dart';

class ProfileServices {
////////////////! getvUser Info ////////////////!
  static Future<UserModel> getUserInfo() async {
    UserModel userProfile;
    final res = await DioHelper.getWithToken(
        endpoint: EndPoints.userInfo, token: Prefs.getData(key: "token"));
    userProfile = UserModel.fromJson(res.data);
    return userProfile;
  }
}
