import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_full_app/product/constants/string_constants.dart';
import 'package:kartal/kartal.dart';

import '../../constants/color_constants.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                title,
                textStyle: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            );
  }
  
}

