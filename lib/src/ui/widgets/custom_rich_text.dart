import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:target/src/service/launch_url.dart';

class CustomRichText extends StatelessWidget with LaunchUrl {
  final double? bottom;
  CustomRichText({
    super.key,
    this.bottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom!),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Privacy Policy',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()..onTap = urlLaunch,
              )
            ],
          ),
        ),
      ),
    );
  }
}
