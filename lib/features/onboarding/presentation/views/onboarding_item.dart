import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.onboarding,
    required this.textTheme,
  });

  final OnboardingModel onboarding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(onboarding.image, height: 0.3.sh, width: 0.7.sw),
        24.verticalSpace,
        if (onboarding.appLogo != null) ...[
          Image.asset(onboarding.appLogo!, height: 0.1.sh, width: 0.75.sw),
        ],
        if (onboarding.title != null && onboarding.description != null) ...[
          Text(onboarding.title!, style: textTheme.titleLarge),
          24.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            onboarding.description!,
            style: textTheme.bodyLarge,
          ),
        ],
        if (onboarding.appLogo != null) ...[70.verticalSpace],
      ],
    );
  }
}