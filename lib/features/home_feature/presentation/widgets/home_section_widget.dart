import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ali Esmailie',
              style: TextStyle(
                fontSize: 60.0,
                color: getPrimaryColor(context),
              ),
            ),
            SizedBox(
              width: 250.0,
              child: Row(
                children: [
                  const Text(
                    "I'm ",
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Developer',
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Designer',
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Freelancer',
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Youtuber',
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
