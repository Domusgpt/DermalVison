import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../profile/domain/user_profile.dart';
import '../../profile/domain/user_profile_provider.dart';
import '../../auth/domain/auth_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  String? _selectedSkinType;
  final List<String> _selectedGoals = [];

  final List<String> _skinTypes = [
    'Dry', 'Oily', 'Combination', 'Normal', 'Sensitive'
  ];

  final List<String> _goals = [
    'Acne Control', 'Anti-Aging', 'Mole Monitoring', 'Hydration', 'Redness Reduction'
  ];

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  Future<void> _completeOnboarding() async {
    final user = ref.read(authStateProvider).value;
    if (user != null) {
      final repo = ref.read(userProfileRepositoryProvider);
      final currentProfile = ref.read(userProfileProvider).value;

      if (currentProfile != null) {
          final updatedProfile = currentProfile.copyWith(
            skinType: _selectedSkinType,
            goals: _selectedGoals,
            onboardingComplete: true,
          );
          await repo.updateProfile(updatedProfile);
      } else {
          await repo.createProfile(UserProfile(
            uid: user.uid,
            email: user.email,
            skinType: _selectedSkinType,
            goals: _selectedGoals,
            onboardingComplete: true,
          ));
      }

      if (mounted) context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding ${_currentPage + 1}/2')),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => setState(() => _currentPage = page),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildSkinTypePage(),
          _buildGoalsPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _canProceed() ? _nextPage : null,
          child: Text(_currentPage == 1 ? 'Finish' : 'Next'),
        ),
      ),
    );
  }

  bool _canProceed() {
      if (_currentPage == 0) return _selectedSkinType != null;
      if (_currentPage == 1) return _selectedGoals.isNotEmpty;
      return false;
  }

  Widget _buildSkinTypePage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Select your Skin Type', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        ..._skinTypes.map((type) => RadioListTile<String>(
          title: Text(type),
          value: type,
          groupValue: _selectedSkinType,
          onChanged: (val) => setState(() => _selectedSkinType = val),
        )),
      ],
    );
  }

  Widget _buildGoalsPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Select your Goals', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        ..._goals.map((goal) => CheckboxListTile(
          title: Text(goal),
          value: _selectedGoals.contains(goal),
          onChanged: (val) {
            setState(() {
              if (val == true) {
                _selectedGoals.add(goal);
              } else {
                _selectedGoals.remove(goal);
              }
            });
          },
        )),
      ],
    );
  }
}
