import 'package:quiz_u/library.dart';

class Option extends StatefulWidget {
  final String letter;
  final String answer;
  final String correctAnswer;
  final Function onTap;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final bool isAnswered;

  const Option(
      {super.key,
      required this.letter,
      required this.answer,
      required this.onTap,
      this.animationController,
      this.animation,
      required this.isAnswered,
      required this.correctAnswer});

  @override
  State<Option> createState() => _OptionState();
}

//
class _OptionState extends State<Option> {
  ///! getTheColor
  Color getTheColor() {
    if (widget.isAnswered) {
      if (widget.letter == widget.correctAnswer) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }

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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                onTap: () => widget.onTap(widget.letter),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: getTheColor(),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  height: Get.height * 0.08,
                  width: context.width,
                  child: Row(
                    children: [
                      //! letter design
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            shape: BoxShape.circle,
                            color: AppBrand.secondColor),
                        child: Center(
                          child: Text(
                            widget.letter,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //!  answer text design
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            widget.answer,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
