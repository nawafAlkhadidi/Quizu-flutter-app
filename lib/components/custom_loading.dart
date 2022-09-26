
import 'package:quiz_u/library.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 80,
      child: LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [AppBrand.mainColor, AppBrand.secondColor],
          strokeWidth: 1,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.black),
    );
  }
}
