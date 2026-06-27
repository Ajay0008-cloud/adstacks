import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProjectItemData {
  final String title;
  final String subtitle;
  final LinearGradient gradient;

  ProjectItemData({
    required this.title,
    required this.subtitle,
    required this.gradient,
  });
}

class AllProjectsWidget extends StatelessWidget {
  const AllProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectItemData(
        title: 'Technology behind the Blockchain',
        subtitle: 'Project #1 • See project details',
        gradient: AppTheme.projectCardRed,
      ),
      ProjectItemData(
        title: 'Technology behind the Blockchain',
        subtitle: 'Project #1 • See project details',
        gradient: AppTheme.projectCardTeal,
      ),
      ProjectItemData(
        title: 'Technology behind the Blockchain',
        subtitle: 'Project #1 • See project details',
        gradient: AppTheme.projectCardPurple,
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
            'All Projects',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ...projects.map((project) => _buildProjectCard(context, project)),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectItemData project) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: project.gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  project.subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit_rounded, color: Colors.white, size: 16),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Editing "${project.title}"')),
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
