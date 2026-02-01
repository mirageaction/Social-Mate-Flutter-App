import 'package:social_mate_app/core/assets_gen/assets.gen.dart';

class OnboardingModel {
  final String? title;
  final String? description;
  final String image;
  final String? appLogo;

  OnboardingModel({
    this.title,
    this.description,
    required this.image,
    this.appLogo,
  });

   static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: Assets.images.onboarding1.path,
      appLogo: Assets.images.appLogo.path,
    ),
    OnboardingModel(
      title: 'Find Friends & Get Inspiration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat vitae quis quam augue quam a.',
      image: Assets.images.onboarding2.path,
    ),
    OnboardingModel(
      title: 'Meet Awesome People & Enjoy yourself',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat vitae quis quam augue quam a.',
      image: Assets.images.onboarding3.path,
    ),
    OnboardingModel(
      title: 'Hangout with with Friends',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat vitae quis quam augue quam a.',
      image: Assets.images.onboarding4.path,
    ),
  ];
}
