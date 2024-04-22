import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/localization/i18n/translations.g.dart';
import 'package:personal_portfolio/core/theme/dimens.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';
import 'package:personal_portfolio/core/widgets/app_scaffold.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';
import 'package:personal_portfolio/core/widgets/general_appbar.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/about_item.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/stats_item.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(
        title: t.about,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.largePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.aboutTitle,
              style: TextStyle(
                color: getPrimaryColor(context),
                fontSize: 20,
              ),
            ),
            const AppVSpace(),
            Text(
              t.loremIpsum,
              textAlign: TextAlign.justify,
            ),
            const AppVSpace(),
            Row(
              children: [
                const FlutterLogo(
                  size: 250,
                ),
                const AppHSpace(),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AboutItem(
                              title: t.birthday,
                              value: t.myBirthday,
                            ),
                          ),
                          Expanded(
                            child: AboutItem(
                              title: t.age,
                              value: '${DateTime.now().year - 1998}',
                            ),
                          ),
                        ],
                      ),
                      const AppVSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AboutItem(
                              title: t.website,
                              value: 'https://google.com/',
                              forceLtrValue: true,
                            ),
                          ),
                          Expanded(
                            child: AboutItem(
                              title: t.degree,
                              value: t.myDegree,
                            ),
                          ),
                        ],
                      ),
                      const AppVSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AboutItem(
                              title: t.phone,
                              value: '+989120465921',
                              forceLtrValue: true,
                            ),
                          ),
                          Expanded(
                            child: AboutItem(
                              title: t.email,
                              value: 'ali.esmailie.eng@gmail.com',
                              forceLtrValue: true,
                            ),
                          ),
                        ],
                      ),
                      const AppVSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AboutItem(
                              title: t.city,
                              value: t.myCity,
                              forceLtrValue: true,
                            ),
                          ),
                          Expanded(
                            child: AboutItem(
                              title: t.freelance,
                              value: t.available,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const AppVSpace(
              space: Dimens.largePadding * 2,
            ),
            Text(
              t.stats,
              style: TextStyle(
                color: getPrimaryColor(context),
                fontSize: 20,
              ),
            ),
            const AppVSpace(
              space: Dimens.mediumPadding * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatsItem(
                  title: t.happyClients,
                  stat: '25',
                  icon: Icons.emoji_emotions_outlined,
                ),
                StatsItem(
                  title: t.projects,
                  stat: '28',
                  icon: Icons.emoji_emotions_outlined,
                ),
                StatsItem(
                  title: t.trainedStudent,
                  stat: '15',
                  icon: Icons.emoji_emotions_outlined,
                ),
                StatsItem(
                  title: t.hoursOfSupport,
                  stat: '250',
                  icon: Icons.emoji_emotions_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
