import 'package:quiz_u/library.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final String pathBlack;
  final String pathGray;
  final double w = 25;
  final double h = 25;
  final double fontsize = 11;
  final int indexPage;
  final Function tab;
  final TabController controller;

  const CustomTab({
    Key? key,
    required this.title,
    required this.pathBlack,
    required this.pathGray,
    required this.indexPage,
    required this.tab,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tab(indexPage),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: indexPage == controller.index
                ? SvgPicture.asset(pathBlack,
                    width: w, height: h, color: Colors.black)
                : SvgPicture.asset(
                    pathGray,
                    width: w,
                    height: h,
                    color: Colors.black,
                  ),
          ),
          // Text(
          //   title,
          //   style: TextStyle(fontSize: fontsize , fontWeight: FontWeight.bold ,  color: Colors.black),
          // ),
        ],
      ),
    );
  }
}
