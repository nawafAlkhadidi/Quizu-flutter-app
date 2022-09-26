import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';

class UserScoreServices {
////////////////////! update Scors ////////////////!
  static Future<bool> updateScore({
    required int score,
  }) async {
    final res = await DioHelper.postWithToken(
        endpoint: EndPoints.userScore,
        data: {"score": score},
        token: Prefs.getData(key: "token"));
    if (res.data["success"] == true) {
      return true;
    }
    return false;
  }
}
