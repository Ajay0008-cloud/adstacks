import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _emailNotifs = true;
  bool _desktopAlerts = true;
  bool _twoFactor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Summary Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppTheme.primaryPurple,
                child: Text('PS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pooja Sharma', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkNavy)),
                    SizedBox(height: 2),
                    Text('pooja.sharma@adstacks.in • Senior Admin', style: TextStyle(fontSize: 12, color: AppTheme.textMuted)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryPurple,
                  side: const BorderSide(color: AppTheme.primaryPurple),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Preferences Section
        const Text(
          'System Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkNavy),
        ),
        const SizedBox(height: 14),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Email Notifications', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.darkNavy)),
                subtitle: const Text('Receive daily attendance & project update summaries', style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                value: _emailNotifs,
                activeColor: AppTheme.primaryPurple,
                onChanged: (val) => setState(() => _emailNotifs = val),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              SwitchListTile(
                title: const Text('Desktop Alerts', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.darkNavy)),
                subtitle: const Text('Real-time popups for birthday & anniversary wishes', style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                value: _desktopAlerts,
                activeColor: AppTheme.primaryPurple,
                onChanged: (val) => setState(() => _desktopAlerts = val),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              SwitchListTile(
                title: const Text('Two-Factor Authentication (2FA)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.darkNavy)),
                subtitle: const Text('Secure your AdStacks admin account with biometrics or SMS', style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                value: _twoFactor,
                activeColor: AppTheme.primaryPurple,
                onChanged: (val) => setState(() => _twoFactor = val),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
