import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/utils/link_helper.dart';
import 'package:praveen_website/widgets/common/app_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSending = false;

  Future<void> _handleSend() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    setState(() => _isSending = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Message sent successfully! We will get back to you soon.',
          ),
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.h64,
        horizontal: AppSpacing.w24,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: _ContactInfo()),
                SizedBox(width: AppSpacing.w32 * 2),
                Expanded(child: _buildForm()),
              ],
            );
          }
          return Column(
            children: [
              const _ContactInfo(),
              SizedBox(height: AppSpacing.h64),
              _buildForm(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          AppTextField(
            label: 'Name',
            hint: 'Your Name',
            controller: _nameController,
          ),
          SizedBox(height: AppSpacing.h16),
          AppTextField(
            label: 'Email',
            hint: 'your@email.com',
            controller: _emailController,
          ),
          SizedBox(height: AppSpacing.h16),
          AppTextField(
            label: 'Message',
            hint: 'How can we help?',
            maxLines: 4,
            controller: _messageController,
          ),
          SizedBox(height: AppSpacing.h32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isSending ? null : _handleSend,
              icon: _isSending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(LucideIcons.send, size: 18),
              label: Text(
                _isSending ? 'Sending...' : 'Send Message',
                style: AppTextStyles.button(context),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideX(begin: 0.1, end: 0);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: AppTextStyles.splashHeading(context, fontSize: 32),
        ),
        SizedBox(height: AppSpacing.h16),
        Text(
          'Have a question, feedback, or just want to say hi? We\'d love to hear from you.',
          style: AppTextStyles.subtitle(
            context,
            color: AppColors.darkSecondaryText,
          ),
        ),
        SizedBox(height: AppSpacing.h32),
        InkWell(
          onTap: () => LinkHelper.sendEmail('support@praveenapps.com'),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    LucideIcons.mail,
                    color: AppColors.buttonColor,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support Email',
                      style: AppTextStyles.small(
                        context,
                        color: AppColors.darkSecondaryText,
                      ),
                    ),
                    Text(
                      'hbpraveen311@gmail.com',
                      style: AppTextStyles.body(
                        context,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ).animate().fadeIn().slideX(begin: -0.1, end: 0);
  }
}
