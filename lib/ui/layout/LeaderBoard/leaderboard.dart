import 'package:quiz_u/library.dart';

class LeaderBoardSrceen extends StatefulWidget {
  const LeaderBoardSrceen({super.key});

  @override
  State<LeaderBoardSrceen> createState() => _LeaderBoardSrceenState();
}

class _LeaderBoardSrceenState extends State<LeaderBoardSrceen>
    with TickerProviderStateMixin {
////////////////! variables !////////////////
  List<TopScoresModel?> topusers = [];
  bool isloading = false;
  AnimationController? animationController;
////////////////! variables !////////////////

////////////////! Get Date when this Screen open !////////////////
  Future getData() async {
    if (mounted) {
      setState(() => isloading = true);
    }

    topusers = await TheTopServices.getLeaderBoard();
    if (mounted) {
      setState(() => isloading = false);
    }
  }
////////////////! Get Date when this Screen open !////////////////

  @override
  void initState() {
    super.initState();
    if (mounted) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 500), vsync: this);
      getData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xffeeeefc)),
      child: Center(
        child: isloading
            ? const Center(child: CustomLoading())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: topusers.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval(
                                        (1 / topusers.length) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController?.forward();
                        return CardOfLeaderBoard(
                            index: index,
                            name: topusers[index]!.name!,
                            score: topusers[index]!.score!,
                            animation: animation,
                            animationController: animationController!);
                      },
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}
