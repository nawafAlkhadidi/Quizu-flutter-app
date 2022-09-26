
import 'package:flutter/material.dart';
import 'package:quiz_u/config/brand.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color backGroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double? font;
  final TextStyle? style;
  final Widget? icon;
  final bool isLoading;

  const DefaultButton({
    Key? key,
    this.width,
    this.font,
    required this.onPress,
    required this.text,
    this.isLoading = false,
    this.height = 56,
    this.style,
    this.icon,
    this.backGroundColor = AppBrand.mainColor,
    this.textColor = AppBrand.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.size!.width * .80,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backGroundColor,
      ),
      child: MaterialButton(
        onPressed: onPress,
        child:  icon ?? Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: style ??
              TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: font,
              ),
        ),
      ),
    );
  }
}
