import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';
import 'package:quiz_u/models/top_scores_model.dart';

class TheTopServices {
// ////////////////! getLeaderBoard ////////////////!
  static Future<List<TopScoresModel?>> getLeaderBoard() async {
    List<TopScoresModel?> topusers = [];
    final res = await DioHelper.getWithToken(
        endpoint: EndPoints.topScores, token: Prefs.getData(key: "token"));
    topusers =
        (res.data as List).map((e) => TopScoresModel?.fromJson(e)).toList();
    return topusers;
  }
}
