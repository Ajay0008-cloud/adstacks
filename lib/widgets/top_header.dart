import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final ValueChanged<String>? onSearchChanged;

  const TopHeader({
    super.key,
    this.title = 'Home',
    this.onMenuPressed,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        children: [
          if (onMenuPressed != null) ...[
            IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppTheme.darkNavy),
              onPressed: onMenuPressed,
            ),
            const SizedBox(width: 8),
          ],
          if (!isMobile) ...[
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkNavy,
              ),
            ),
            const SizedBox(width: 32),
          ],

          // Dark Search Field matching reference screenshot
          Expanded(
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.darkNavyCard,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: onSearchChanged,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 13, color: AppTheme.textMuted),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const Icon(Icons.search_rounded, size: 18, color: Colors.white70),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Action Icons matching reference image
          Row(
            children: [
              _buildHeaderIcon(
                icon: Icons.notifications_none_rounded,
                hasBadge: true,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications opened')),
                  );
                },
              ),
              const SizedBox(width: 10),
              _buildHeaderIcon(
                icon: Icons.card_giftcard_rounded,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Events & Rewards opened')),
                  );
                },
              ),
              const SizedBox(width: 10),
              _buildHeaderIcon(
                icon: Icons.power_settings_new_rounded,
                iconColor: Colors.redAccent,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Session quick exit')),
                  );
                },
              ),
              const SizedBox(width: 14),
              // User Profile Avatar with gold/yellow border
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.goldStar, width: 1.5),
                ),
                child: const CircleAvatar(
                  radius: 17,
                  backgroundColor: AppTheme.primaryPurple,
                  child: Text(
                    'P',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon({
    required IconData icon,
    bool hasBadge = false,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Icon(icon, size: 19, color: iconColor ?? AppTheme.darkNavy),
            if (hasBadge)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppTheme.coralPink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
