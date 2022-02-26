import 'package:appng/src/mvp/onboarding/model/onboarding_data_model.dart';
import 'package:appng/utilities/asset/asset_utilities.dart';
import 'package:flutter/material.dart';

/// Provider class of Onboarding screen to manage onboarding.
class OnBoardingProvider extends ChangeNotifier {
  /// List of data to show on onboarding screen.
  List<OnBoardingDataModel> onboardingDataList = [
    OnBoardingDataModel(
        image: AssetUtilities.onBoarding01,
        title: 'IDK LEARNINGS',
        description: 'FIRST ONBOARDING SCREEN',
        index: 0),
    OnBoardingDataModel(
        image: AssetUtilities.onBoarding02,
        title: 'Dictionary',
        description: 'Explain Features of Dictionary',
        index: 1),
    OnBoardingDataModel(
        image: AssetUtilities.onBoarding03,
        title: 'Flashcards',
        description: 'Explain Features of Flashcards',
        index: 2),
    OnBoardingDataModel(
        image: AssetUtilities.onBoarding04,
        title: 'Texts',
        description: 'Explain Features of Texts',
        index: 3),
    OnBoardingDataModel(
        image: AssetUtilities.onBoarding05,
        title: 'Games',
        description: 'Explain Features of Games',
        index: 4),
  ];

  int _currentSelectedOnBoardingIndex = 0;

  /// getter and setter of currentSelectedOnBoardingIndex.
  int get currentSelectedOnBoardingIndex => _currentSelectedOnBoardingIndex;
  set currentSelectedOnBoardingIndex(int value) {
    _currentSelectedOnBoardingIndex = value;
    notifyListeners();
  }

  /// function to handle on change event of pageview.
  void onPageChange(int currentPageIndex) {
    currentSelectedOnBoardingIndex = currentPageIndex;
  }

  /// function to move on next page.
  void moveToNextPage() {
    incrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedOnBoardingIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  /// function to increment current selected page index.
  void incrementCurrentPageIndex() {
    if (currentSelectedOnBoardingIndex != onboardingDataList.length - 1) {
      currentSelectedOnBoardingIndex = currentSelectedOnBoardingIndex + 1;
    }
  }

  /// function to move on previous page.
  void moveToPreviousPage() {
    decrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedOnBoardingIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  /// function to decrement current selected page index.
  void decrementCurrentPageIndex() {
    if (currentSelectedOnBoardingIndex != 0) {
      currentSelectedOnBoardingIndex = currentSelectedOnBoardingIndex - 1;
    }
  }

  /// function to skip onboarding Process.
  void skipOnBoarding() {
    if (currentSelectedOnBoardingIndex != onboardingDataList.length - 1) {
      currentSelectedOnBoardingIndex = onboardingDataList.length - 1;
    }
    pageController.animateToPage(
      currentSelectedOnBoardingIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  /// controller to handle pageview.
  PageController pageController = PageController(initialPage: 0);
}
