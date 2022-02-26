import 'package:appng/src/mvp/onboarding/provider/onboarding_provider.dart';
import 'package:appng/src/widget/image/custom_image_view.dart';
import 'package:appng/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// OnBoarding Screen.
class OnBoardingScreen extends StatefulWidget {
  /// constructor of onboarding screen.
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (BuildContext context, OnBoardingProvider _onBoardingProvider,
            Widget? child) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  key: const Key('OnBoardingPageview'),
                  controller: _onBoardingProvider.pageController,
                  onPageChanged: _onBoardingProvider.onPageChange,
                  children: _onBoardingProvider.onboardingDataList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 100),
                              Container(
                                child: Center(
                                  child: CustomImageView(
                                    imageUrl: e.image,
                                    width: VariableUtilities.screenSize.width *
                                        0.5,
                                    height:
                                        VariableUtilities.screenSize.height *
                                            0.41,
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                e.title,
                                style: FontUtilities.h20(
                                  fontColor: VariableUtilities.theme.blackColor,
                                  fontWeight: FWT.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                e.description,
                                style: FontUtilities.h12(
                                  fontColor: VariableUtilities.theme.blackColor,
                                  fontWeight: FWT.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 50),
              Consumer<OnBoardingProvider>(
                builder: (BuildContext context,
                    OnBoardingProvider _onBoardingProvider, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      _onBoardingProvider.onboardingDataList.length,
                      (index) => Container(
                        height: 7,
                        width: 7,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _onBoardingProvider
                                        .currentSelectedOnBoardingIndex ==
                                    index
                                ? VariableUtilities.theme.primaryColor600
                                : VariableUtilities.theme.onSurfaceColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _onBoardingProvider.currentSelectedOnBoardingIndex != 0
                      ? TextButton(
                          key: const Key('onboarding_back_button_key'),
                          onPressed: _onBoardingProvider.moveToPreviousPage,
                          child: Text(
                            l10n!.buttonBack.toUpperCase(),
                            style: FontUtilities.h14(
                              fontColor:
                                  VariableUtilities.theme.primaryColor800,
                              fontWeight: FWT.semiBold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  _onBoardingProvider.currentSelectedOnBoardingIndex !=
                          _onBoardingProvider.onboardingDataList.length - 1
                      ? TextButton(
                          key: const Key('onboarding_next_button_key'),
                          onPressed: _onBoardingProvider.moveToNextPage,
                          child: Text(
                            l10n!.buttonNext.toUpperCase(),
                            style: FontUtilities.h14(
                              fontColor:
                                  VariableUtilities.theme.primaryColor800,
                              fontWeight: FWT.semiBold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(height: 20),
              _onBoardingProvider.currentSelectedOnBoardingIndex ==
                      _onBoardingProvider.onboardingDataList.length - 1
                  ? GestureDetector(
                      key: const Key('onboarding_get_started_button_key'),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteUtilities.signinOptionsScreen,
                          (route) => route.toString() == RouteUtilities.root,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 11),
                        decoration: BoxDecoration(
                          color: VariableUtilities.theme.primaryColor500,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          l10n!.buttonGetStarted.toUpperCase(),
                          style: FontUtilities.h14(
                            fontColor: VariableUtilities.theme.blackColor,
                            fontWeight: FWT.semiBold,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      key: const Key('onboarding_skip_button_key'),
                      onTap: _onBoardingProvider.skipOnBoarding,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: VariableUtilities.theme.blackColor
                                .withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          l10n!.buttonSkip.toUpperCase(),
                          style: FontUtilities.h14(
                            fontColor: VariableUtilities.theme.primaryColor800,
                            fontWeight: FWT.semiBold,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
