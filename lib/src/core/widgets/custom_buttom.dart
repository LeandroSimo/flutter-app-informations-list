import 'package:flutter/material.dart';
import 'package:target/src/core/global/app_colors.dart';

class CustomButtom extends StatelessWidget {
  final double? heigtht;
  final Function() onPressed;
  final Widget child;
  final Color? color;
  final bool? isBorder;

  const CustomButtom({
    super.key,
    this.heigtht,
    required this.onPressed,
    required this.child,
    this.color,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      onPressed: onPressed,
      height: heigtht,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: isBorder!
            ? const BorderSide(
                color: primaryColor,
              )
            : BorderSide.none,
      ),
      color: color,
      child: child,
    );
  }
}
