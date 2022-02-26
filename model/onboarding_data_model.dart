/// this class represent the schema of onboarding data.
class OnBoardingDataModel {
  /// constructor of OnboardingDataModel Class.
  OnBoardingDataModel({
    required this.image,
    required this.title,
    required this.description,
    required this.index,
  });

  /// onboarding image.
  final String image;

  /// onboarding title.
  final String title;

  /// onboarding description.
  final String description;

  /// onboarding data index.
  final int index;
}
