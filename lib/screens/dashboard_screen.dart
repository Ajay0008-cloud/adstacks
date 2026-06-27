import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/sidebar_navigation.dart';
import '../widgets/top_header.dart';
import '../widgets/top_rating_project_banner.dart';
import '../widgets/all_projects_widget.dart';
import '../widgets/top_creators_widget.dart';
import '../widgets/performance_chart_widget.dart';
import '../widgets/right_widget_panel.dart';
import 'employees_screen.dart';
import 'attendance_screen.dart';
import 'summary_screen.dart';
import 'information_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedNavItem = 'Home';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildBodyContent(bool isWideDesktop) {
    switch (_selectedNavItem) {
      case 'Employees':
        return const EmployeesScreen();
      case 'Attendance':
        return const AttendanceScreen();
      case 'Summary':
        return const SummaryScreen();
      case 'Information':
        return const InformationScreen();
      case 'Setting':
        return const SettingsScreen();
      case 'Home':
      default:
        return Column(
          children: [
            const TopRatingProjectBanner(),
            const SizedBox(height: 24),
            if (isWideDesktop)
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: AllProjectsWidget()),
                  SizedBox(width: 20),
                  Expanded(flex: 4, child: TopCreatorsWidget()),
                ],
              )
            else
              const Column(
                children: [
                  AllProjectsWidget(),
                  SizedBox(height: 20),
                  TopCreatorsWidget(),
                ],
              ),
            const SizedBox(height: 24),
            const PerformanceChartWidget(),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1150;
    final isWideDesktop = screenWidth >= 950;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.bgLight,
      drawer: !isDesktop
          ? Drawer(
              child: SidebarNavigation(
                selectedItem: _selectedNavItem,
                onItemSelected: (item) {
                  setState(() => _selectedNavItem = item);
                  Navigator.of(context).pop();
                },
              ),
            )
          : null,
      body: Row(
        children: [
          // Left Sidebar for Desktop & Laptop PCs
          if (isDesktop)
            SidebarNavigation(
              selectedItem: _selectedNavItem,
              onItemSelected: (item) {
                setState(() => _selectedNavItem = item);
              },
            ),

          // Center & Main Body Area
          Expanded(
            child: Column(
              children: [
                TopHeader(
                  title: _selectedNavItem,
                  onMenuPressed: !isDesktop
                      ? () => _scaffoldKey.currentState?.openDrawer()
                      : null,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                    children: [
                      _buildBodyContent(isWideDesktop),
                      if (!isDesktop) ...[
                        const SizedBox(height: 24),
                        const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: RightWidgetPanel(isEmbeddedInScroll: true),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Right Panel for Desktop & Large Monitors
          if (isDesktop) const RightWidgetPanel(isEmbeddedInScroll: false),
        ],
      ),
    );
  }
}
