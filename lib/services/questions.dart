import 'package:quiz_u/config/endpoints.dart';
import 'package:quiz_u/helpers/dio_helper.dart';
import 'package:quiz_u/helpers/shared_prefs.dart';
import 'package:quiz_u/models/question_model.dart';

class QuestionsServices {
////////////////////! get All The Questions ////////////////!
  static Future<List<QuestionModel?>> getAllTheQuestions() async {
    List<QuestionModel?> questions = [];
    final res = await DioHelper.getWithToken(
        endpoint: EndPoints.questions, token: Prefs.getData(key: "token"));
    questions =
        (res.data as List).map((e) => QuestionModel?.fromJson(e)).toList();
    return questions;
  }
}
