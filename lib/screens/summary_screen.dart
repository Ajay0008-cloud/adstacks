import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/performance_chart_widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // KPI Summary Cards
        Row(
          children: [
            Expanded(child: _buildKpiCard('Completed Projects', '24', '+12% this month', Icons.task_alt_rounded, AppTheme.tealAccent)),
            const SizedBox(width: 14),
            Expanded(child: _buildKpiCard('Active Sprints', '6', '2 closing soon', Icons.speed_rounded, AppTheme.primaryPurple)),
            const SizedBox(width: 14),
            Expanded(child: _buildKpiCard('Client Rating', '4.9/5.0', '98% satisfaction', Icons.star_rounded, AppTheme.orangeAccent)),
          ],
        ),
        const SizedBox(height: 24),

        // Performance Chart Reused
        const PerformanceChartWidget(),
        const SizedBox(height: 24),

        // Milestones Summary Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quarterly Key Results & Deliverables',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.darkNavy),
              ),
              const SizedBox(height: 16),
              _buildMilestoneRow('Ethereum 2.0 Integration', 0.9, '90% Done'),
              const SizedBox(height: 12),
              _buildMilestoneRow('AdStacks Media Web Dashboard v2.0', 1.0, '100% Done'),
              const SizedBox(height: 12),
              _buildMilestoneRow('AI Analytics Engine Core', 0.65, '65% Done'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKpiCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 12, color: AppTheme.textMuted, fontWeight: FontWeight.w500)),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.darkNavy)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMilestoneRow(String title, double progress, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.darkNavy)),
            Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.primaryPurple, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: AlwaysStoppedAnimation<Color>(progress == 1.0 ? AppTheme.tealAccent : AppTheme.primaryPurple),
          ),
        ),
      ],
    );
  }
}
