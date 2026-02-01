import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_mate_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:social_mate_app/features/onboarding/presentation/views/onboarding_item.dart';
import 'package:social_mate_app/features/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final items = OnboardingModel.onboardingList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.55.sh,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: _onPageChanged,
                  clipBehavior: Clip.none,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final onboarding = items[index];
                    
                    return OnboardingItem(
                      onboarding: onboarding,
                      textTheme: textTheme,
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: items.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: colorScheme.primary,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  expansionFactor: 4,
                  spacing: 8.w,
                ),
              ),
              if (_currentIndex != 0) ...[
                50.verticalSpace,
                CustomButton(title: 'Join Now', onPressed: () {}),
                24.verticalSpace,
                CustomButton(
                  title: 'Sign in',
                  onPressed: () {},
                  backgroundColor: colorScheme.surface,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
