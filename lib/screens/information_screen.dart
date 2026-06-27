import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      {'title': 'HR & Leave Policy 2026', 'desc': 'Updated leave policy documents, medical allowances, and perks.', 'icon': Icons.gavel_rounded, 'color': AppTheme.primaryPurple},
      {'title': 'IT & Security Guidelines', 'desc': 'Cybersecurity protocols, VPN setup, and device password rules.', 'icon': Icons.security_rounded, 'color': AppTheme.tealAccent},
      {'title': 'AdStacks Brand Kit', 'desc': 'Official logos, typography guidelines, and media assets.', 'icon': Icons.palette_rounded, 'color': AppTheme.orangeAccent},
      {'title': 'Helpdesk Support', 'desc': 'Need technical assistance? Reach out to support@adstacks.in.', 'icon': Icons.support_agent_rounded, 'color': Colors.pinkAccent},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Office Notice Banner Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.darkNavy,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppTheme.coralPink, shape: BoxShape.circle),
                child: const Icon(Icons.campaign_rounded, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Official Announcement', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Quarter 3 Townhall Scheduled for next Friday at 4:00 PM IST.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        const Text(
          'Company Guidelines & Support',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkNavy),
        ),
        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
            mainAxisExtent: 130,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: infoItems.length,
          itemBuilder: (context, index) {
            final item = infoItems[index];
            return _buildInfoTile(
              item['title'] as String,
              item['desc'] as String,
              item['icon'] as IconData,
              item['color'] as Color,
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoTile(String title, String desc, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.darkNavy)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 11, color: AppTheme.textMuted, height: 1.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
