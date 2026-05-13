import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/widgets/navbar.dart';
import 'package:praveen_website/widgets/footer.dart';
import 'package:praveen_website/widgets/sections/hero_section.dart';
import 'package:praveen_website/widgets/sections/apps_section.dart';
import 'package:praveen_website/widgets/sections/features_section.dart';
import 'package:praveen_website/widgets/sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _supportKey = GlobalKey();
  final GlobalKey _privacyKey = GlobalKey();
  final GlobalKey _termsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _heroKey,
                  onContactPressed: () => _scrollToSection(_contactKey),
                  onViewAppsPressed: () => _scrollToSection(_appsKey),
                ),
                AppsSection(key: _appsKey),
                FeaturesSection(key: _featuresKey),
                ContactSection(key: _contactKey),
                
                // Support Section
                _SimpleSection(
                  key: _supportKey,
                  title: 'Support Center',
                  subtitle: 'Need help? We\'re here to assist you.',
                ),
                
                // Privacy Section
                _SimpleSection(
                  key: _privacyKey,
                  title: 'Privacy Policy',
                  subtitle: 'Your privacy is important to us. Learn how we handle your data.',
                ),
                
                // Terms Section
                _SimpleSection(
                  key: _termsKey,
                  title: 'Terms & Conditions',
                  subtitle: 'Please read our terms and conditions carefully.',
                ),

                Footer(
                  onPrivacyPressed: () => _scrollToSection(_privacyKey),
                  onTermsPressed: () => _scrollToSection(_termsKey),
                  onSupportPressed: () => _scrollToSection(_supportKey),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onAppsPressed: () => _scrollToSection(_appsKey),
              onFeaturesPressed: () => _scrollToSection(_featuresKey),
              onAboutPressed: () => _scrollToSection(_heroKey),
              onSupportPressed: () => _scrollToSection(_supportKey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _SimpleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SimpleSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64 * 1.5, horizontal: AppSpacing.w24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1))),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.splashHeading(context, fontSize: 40),
          ),
          SizedBox(height: AppSpacing.h16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle(context, color: AppColors.darkSecondaryText),
          ),
          const SizedBox(height: 60),
          // Placeholder for actual policy/terms text
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: AppTextStyles.body(context, color: AppColors.darkSecondaryText),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
