import 'dart:async';
import 'package:quiz_u/library.dart';
import 'package:quiz_u/services/userscore.dart';
import 'package:quiz_u/ui/layout/Quiz/options_card.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
////////////////! variables !////////////////
  List<QuestionModel?> listOfquestion = [];
  bool isloading = false;
  int questionNumber = 1;
  Timer? timer;
  int timeOfGame = 120;
  bool isAnswered = false;
  List<String> letter = ["a", "b", "c", "d"];
  int scores = 0;
  bool isSkip = false;
  AnimationController? animationController;
////////////////! Get Date when this Screen open !////////////////
  Future getData() async {
    setState(() => isloading = true);
    listOfquestion = await QuestionsServices.getAllTheQuestions();
    setState(() => isloading = false);
    startTimer();
    animation();
  }

////////////////! start Timer ////////////////
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //? Countdown Timer  (time -1)
      setState(() {
        timeOfGame--;
      });
      //? when the time's up
      if (timeOfGame == 0) {
        if (scores != 0) {
          saveScores();
        }
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                path: "assets/icons/timeup1.svg",
                title: "time's up",
                descriptions: "You have completed $scores correct answers!",
                text: "Share",
                onPressed: () async {
                  await Share.share(
                      "I answered $scores correct answers in QuizU!");
                  Get.back();
                  Get.back();
                },
              );
            });
      }
    });
  }

////////////////! Function to skip question ////////////////!
  Future<void> skip() async {
    setState(() {
      //? next questio
      questionNumber++;
      //?skip button that can be clicked only once
      isSkip = true;
    });
    //? animation
    animation();
  }

////////////////! Function to animation ////////////////!
  void animation() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

////////////////! Function to start new games ////////////////!
  void newGames() {
    //? Clear variables to start new games
    setState(() {
      questionNumber = 1;
      isSkip = false;
      isAnswered = false;
      timeOfGame = 120;
      scores = 0;
    });
    startTimer();
    Navigator.of(context).pop();
  }
////////////////! save Scores ////////////////!

  Future<void> saveScores() async {
    String saveScores =
        "${DateFormat("dd/MM/yyyy").format(DateTime.now())}|${DateFormat.jm().format(DateTime.now())}|$scores";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> scoreOfUser =
        prefs.getStringList(Prefs.getData(key: "mobile")) ?? [];
    scoreOfUser.add(saveScores);
    await prefs.setStringList(Prefs.getData(key: "mobile"), scoreOfUser);
    UserScoreServices.updateScore(score: scores);
    timer?.cancel();
  }

////////////////! Function To check the answer ////////////////!
  void isCorrect(String? letter) async {
    setState(() => isAnswered = true);
    //? when the answered is correct
    if (letter == listOfquestion[questionNumber - 1]!.correct) {
      await Future.delayed(const Duration(milliseconds: 300));
      //? when the user complate all questions
      if (questionNumber == listOfquestion.length) {
        scores++;
        saveScores();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                path: "assets/icons/trophy-icon.svg",
                title: "Win Over",
                text: "Share",
                descriptions: "You have completed $scores correct answers!",
                onPressed: () async {
                  await Share.share(
                      "I answered $scores correct answers in QuizU!");
                  Get.back();
                  Get.back();
                },
              );
            });
      } else {
        setState(() {
          scores++;
          questionNumber++;
          isAnswered = false;
        });
        animation();
      }
    } else {
      //? when the answered is not correct
      timer?.cancel();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              path: "assets/icons/game_over1_icon.svg",
              title: "Wrong Answer",
              text: "Try Again",
              descriptions: "",
              onPressed: newGames,
            );
          });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Navigator.of(context).pop();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    animationController?.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isloading
          ? const SizedBox()
          : isSkip
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * .08,
                    vertical: context.height * .05,
                  ),
                  child: DefaultButton(
                    onPress: skip,
                    text: "skip",
                    width: double.infinity,
                    font: 35,
                    height: 65,
                    textColor: AppBrand.whiteColor,
                  ),
                ),
      backgroundColor: AppBrand.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppBrand.backgroundColor,
        title: Text(
          "Question $questionNumber / ${listOfquestion.length}",
          style: const TextStyle(
              color: AppBrand.secondColor, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppBrand.mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: isloading
            ? const Center(child: CustomLoading())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * .08,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //! time
                      Text(
                        formatHHMMSS(timeOfGame),
                        style: TextStyle(
                            color: timeOfGame <= 30
                                ? Colors.red
                                : AppBrand.whiteColor,
                            fontSize: 60),
                      ),
                      //! question
                      SizedBox(
                        height: Get.height * 0.15,
                        child: Text(
                          textAlign: TextAlign.start,
                          listOfquestion[questionNumber - 1]!
                              .question
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                      //! list of options
                      ListView.builder(
                        itemCount: letter.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (
                          BuildContext context,
                          int index1,
                        ) {
                          final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / letter.length) * index1, 1.0,
                                          curve: Curves.fastOutSlowIn)));
                          animationController?.forward();
                          //! add the options to new list
                          List<String?> options = [];
                          options.add(
                              listOfquestion[questionNumber - 1]!.a.toString());
                          options.add(
                              listOfquestion[questionNumber - 1]!.b.toString());
                          options.add(
                              listOfquestion[questionNumber - 1]!.c.toString());
                          options.add(
                              listOfquestion[questionNumber - 1]!.d.toString());
                          return Option(
                              answer: options[index1].toString(),
                              correctAnswer:
                                  listOfquestion[questionNumber - 1]!.correct!,
                              isAnswered: isAnswered,
                              onTap: isCorrect,
                              letter: letter[index1],
                              animation: animation,
                              animationController: animationController!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
