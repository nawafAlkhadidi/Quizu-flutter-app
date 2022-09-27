import 'package:quiz_u/library.dart';

class CardOfLeaderBoard extends StatefulWidget {
  final int? index;
  final String name;
  final int score;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const CardOfLeaderBoard(
      {super.key,
      required this.index,
      required this.name,
      required this.score,
      this.animationController,
      this.animation});

  @override
  State<CardOfLeaderBoard> createState() => _CardOfLeaderBoardState();
}

class _CardOfLeaderBoardState extends State<CardOfLeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppBrand.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                height: 80,
                child: Row(
                  children: [
                    //! sequential numbering
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 22,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            shape: BoxShape.circle,
                            color: AppBrand.secondColor),
                        child: Center(
                          child: Text(
                            (widget.index! + 1).toString(),
                            style: const TextStyle(
                                fontSize: 11,
                                color: AppBrand.blackColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/avatarProfile.svg",
                        height: 50, width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! player name
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppBrand.blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        //! player Scores
                        Text(
                          "${widget.score} scores",
                          style: const TextStyle(
                              fontSize: 13, color: AppBrand.greyColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
