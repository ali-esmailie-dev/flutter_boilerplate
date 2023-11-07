import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/utils/sized_context.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_button.dart';
import 'package:flutter_boilerplate/core/widgets/page_indicator.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/introduction_cubit.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final List<String> titles = [
      'Simple title',
      'Simple title',
      'Simple title',
      'Simple title',
    ];
    final List<String> descriptions = [
      t.smallLoremIpsum,
      t.smallLoremIpsum,
      t.smallLoremIpsum,
      t.smallLoremIpsum,
    ];
    return BlocProvider(
      create: (final BuildContext context) => IntroductionCubit(),
      child: BlocBuilder<IntroductionCubit, int>(
        builder: (final BuildContext context, final int state) {
          return Scaffold(
            body: PageView.builder(
              controller: pageController,
              onPageChanged: (final int position) {
                context.read<IntroductionCubit>().onPageChanged(position);
              },
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (final BuildContext context, final int position) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: context.sizePx.width,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: context.sizePx.height * 0.1,
                          bottom: 16.0,
                        ),
                        child: Text(
                          titles[position] + (state + 1).toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: context.sizePx.width,
                        height: context.sizePx.height * 0.4,
                        margin: const EdgeInsets.all(Dimens.mediumPadding),
                        child: const FlutterLogo(),
                      ),
                      Container(
                        width: context.sizePx.width,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 10.0,
                        ),
                        child: Text(
                          descriptions[position],
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 1.8),
                        ),
                      ),
                      const SizedBox(height: 125.0),
                    ],
                  ),
                );
              },
            ),
            bottomSheet: SizedBox(
              height: 120.0,
              child: Column(
                children: [
                  const AppVSpace(space: Dimens.veryLargePadding),
                  SizedBox(
                    height: Dimens.base,
                    child: AppPageIndicator(
                      controller: pageController,
                      count: 4,
                    ),
                  ),
                  const AppVSpace(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120.0,
                          child: AppButton(
                            title: state == 3 ? t.enterToApp : t.next,
                            onPressed: () {
                              context.read<IntroductionCubit>().onNextTap(
                                    context,
                                    pageController,
                                  );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 120.0,
                          child: AppButton(
                            title: t.skip,
                            onPressed: () {
                              context
                                  .read<IntroductionCubit>()
                                  .onSkipTap(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
