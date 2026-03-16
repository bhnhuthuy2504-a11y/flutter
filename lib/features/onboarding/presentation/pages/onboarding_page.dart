import 'package:flutter/material.dart';

import '../widgets/onboarding_slide.dart';
import '../widgets/dot_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  final _slides = const [
    OnboardingSlide(
      imageAsset: 'assets/images/onboarding_1.png',
      title: 'Control your home',
      description:
          'Manage all your smart devices from a single, intuitive dashboard.',
    ),
    OnboardingSlide(
      imageAsset: 'assets/images/onboarding_2.png',
      title: 'Automate routines',
      description:
          'Create custom scenes and schedules that fit your daily life.',
    ),
    OnboardingSlide(
      imageAsset: 'assets/images/onboarding_3.png',
      title: 'Stay informed',
      description:
          'Get real-time alerts and insights about what matters at home.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentIndex < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // TODO: Navigate to sign in or home.
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Skip onboarding, navigate accordingly.
                  },
                  child: const Text('Skip'),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) => _slides[index],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: DotIndicator(isActive: index == _currentIndex),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onNext,
                  child: Text(
                    _currentIndex == _slides.length - 1 ? 'Get started' : 'Next',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${_currentIndex + 1} / ${_slides.length}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
