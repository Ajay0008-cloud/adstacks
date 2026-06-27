import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreatorModel {
  final String handle;
  final int artworks;
  final double ratingProgress;
  final Color avatarBg;

  CreatorModel({
    required this.handle,
    required this.artworks,
    required this.ratingProgress,
    required this.avatarBg,
  });
}

class TopCreatorsWidget extends StatelessWidget {
  const TopCreatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      CreatorModel(
        handle: '@artdirector_01',
        artworks: 983,
        ratingProgress: 0.92,
        avatarBg: Colors.indigo,
      ),
      CreatorModel(
        handle: '@prashant_02',
        artworks: 983,
        ratingProgress: 0.85,
        avatarBg: Colors.purple,
      ),
      CreatorModel(
        handle: '@madhan_03',
        artworks: 983,
        ratingProgress: 0.78,
        avatarBg: Colors.teal,
      ),
      CreatorModel(
        handle: '@madhan_04',
        artworks: 983,
        ratingProgress: 0.68,
        avatarBg: Colors.deepOrange,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.darkNavyCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Table Headers matching image
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 12, color: AppTheme.textMuted, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Artworks',
                    style: TextStyle(fontSize: 12, color: AppTheme.textMuted, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Rating',
                    style: TextStyle(fontSize: 12, color: AppTheme.textMuted, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Creator Items
          ...creators.map((c) => _buildCreatorRow(c)),
        ],
      ),
    );
  }

  Widget _buildCreatorRow(CreatorModel creator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Row(
        children: [
          // Name & Avatar
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: creator.avatarBg,
                  child: Text(
                    creator.handle.substring(1, 2).toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    creator.handle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Artworks Count
          Expanded(
            flex: 2,
            child: Text(
              '${creator.artworks}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Rating Bar Indicator matching image
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 65,
                height: 7,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: creator.ratingProgress,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.primaryPurple, AppTheme.tealAccent],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
