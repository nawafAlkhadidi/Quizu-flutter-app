import 'package:quiz_u/library.dart';
import 'package:quiz_u/ui/layout/Quiz/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .06,
          // vertical: context.height * .02,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color:  Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: Get.height * 0.11,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                    child: Text(
                      "Are You Ready ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15 ),
                    child: Text(
                      "to test your knoweldge and challenge others ?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            InkWell(
              onTap: () async => await Get.to(() => const QuizzesScreen()),
              child: SvgPicture.asset(
                "assets/icons/StartIcon.svg",
                height: context.height * 0.15,
                width: context.width * 0.6,
                color: AppBrand.mainColor,
              ),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "Answer as much questions correctly within 2 minutes",
                style: TextStyle(
                    color: Color(0xfff7ddfb),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
