import 'package:quiz_u/library.dart';
import 'package:quiz_u/ui/layout/Quiz/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
//! check Token
    AuthServices.checksToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .06,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                "assets/images/quiz-maker-app.png",
                height: Get.height * 0.32,
              )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Are You Ready ?",
                  style: TextStyle(
                      color: AppBrand.mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "to test your knoweldge and challenge others",
                  //textAlign: TextAlign.justify,

                  style: TextStyle(
                      color: AppBrand.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: Get.height * 0.3,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Answer as much questions correctly within 2 minutes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppBrand.blackColor,
                                wordSpacing: 2.5,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: DefaultButton(
                            onPress: () async =>
                                await Get.to(() => const QuizzesScreen()),
                            text: "Quiz Me!",
                            width: double.infinity,
                            font: 35,
                            height: 65,
                            textColor: AppBrand.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
