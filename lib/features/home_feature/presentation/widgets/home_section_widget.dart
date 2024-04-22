import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/localization/i18n/translations.g.dart';
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
              t.myName,
              style: TextStyle(
                fontSize: 60.0,
                color: getPrimaryColor(context),
              ),
            ),
            SizedBox(
              width: 250.0,
              child: Row(
                children: [
                  Text(
                    t.iAm,
                    style: const TextStyle(
                      fontSize: 35.0,
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
                          t.developer,
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontFamily: 'IranYekanXFaNum',
                          ),
                        ),
                        TypewriterAnimatedText(
                          t.designer,
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontFamily: 'IranYekanXFaNum',
                          ),
                        ),
                        TypewriterAnimatedText(
                          t.freelancer,
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontFamily: 'IranYekanXFaNum',
                          ),
                        ),
                        TypewriterAnimatedText(
                          t.youtuber,
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontFamily: 'IranYekanXFaNum',
                          ),
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
