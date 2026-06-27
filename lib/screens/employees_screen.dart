import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EmployeeModel {
  final String name;
  final String role;
  final String department;
  final String email;
  final String status; // Active, On Leave, Remote
  final Color avatarColor;

  EmployeeModel({
    required this.name,
    required this.role,
    required this.department,
    required this.email,
    required this.status,
    required this.avatarColor,
  });
}

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final List<EmployeeModel> _allEmployees = [
    EmployeeModel(name: 'Pooja Sharma', role: 'Senior Product Manager', department: 'Management', email: 'pooja.s@adstacks.in', status: 'Active', avatarColor: AppTheme.primaryPurple),
    EmployeeModel(name: 'Madhan Kumar', role: 'Lead UI/UX Designer', department: 'Design', email: 'madhan.k@adstacks.in', status: 'Active', avatarColor: Colors.indigo),
    EmployeeModel(name: 'Prashant Singh', role: 'Flutter Tech Lead', department: 'Engineering', email: 'prashant.s@adstacks.in', status: 'Active', avatarColor: Colors.teal),
    EmployeeModel(name: 'Ananya Roy', role: 'Frontend Engineer', department: 'Engineering', email: 'ananya.r@adstacks.in', status: 'On Leave', avatarColor: Colors.orangeAccent),
    EmployeeModel(name: 'Vikram Mehta', role: 'Fullstack Developer', department: 'Engineering', email: 'vikram.m@adstacks.in', status: 'Remote', avatarColor: Colors.purpleAccent),
    EmployeeModel(name: 'Rishabh Verma', role: 'DevOps Specialist', department: 'Infrastructure', email: 'rishabh.v@adstacks.in', status: 'Active', avatarColor: Colors.blueAccent),
  ];

  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final filtered = _filter == 'All'
        ? _allEmployees
        : _allEmployees.where((e) => e.status == _filter).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Overview Stat Cards
        Row(
          children: [
            Expanded(child: _buildStatCard('Total Staff', '${_allEmployees.length}', Icons.people_alt_rounded, AppTheme.primaryPurple)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('Active Today', '${_allEmployees.where((e) => e.status == "Active").length}', Icons.check_circle_rounded, AppTheme.tealAccent)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('On Leave', '${_allEmployees.where((e) => e.status == "On Leave").length}', Icons.time_to_leave_rounded, AppTheme.coralPink)),
          ],
        ),
        const SizedBox(height: 24),

        // Header & Filter Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Employee Directory',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkNavy),
            ),
            Row(
              children: ['All', 'Active', 'On Leave', 'Remote'].map((status) {
                final isSelected = _filter == status;
                return Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: ChoiceChip(
                    label: Text(status),
                    selected: isSelected,
                    selectedColor: AppTheme.darkNavy,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    onSelected: (val) {
                      if (val) setState(() => _filter = status);
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Employee Cards Grid / List
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
            mainAxisExtent: 110,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final emp = filtered[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: emp.avatarColor,
                    child: Text(
                      emp.name.split(' ').map((e) => e[0]).take(2).join(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              emp.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkNavy),
                            ),
                            const SizedBox(width: 8),
                            _buildStatusBadge(emp.status),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          emp.role,
                          style: const TextStyle(fontSize: 12, color: AppTheme.primaryPurple, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${emp.department} • ${emp.email}',
                          style: const TextStyle(fontSize: 11, color: AppTheme.textMuted),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded, color: AppTheme.textMuted),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 11, color: AppTheme.textMuted)),
              Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkNavy)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color fg;
    if (status == 'Active') {
      bg = AppTheme.tealAccent.withValues(alpha: 0.15);
      fg = AppTheme.tealAccent;
    } else if (status == 'On Leave') {
      bg = AppTheme.coralPink.withValues(alpha: 0.15);
      fg = AppTheme.coralPink;
    } else {
      bg = Colors.purpleAccent.withValues(alpha: 0.15);
      fg = Colors.purpleAccent;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: fg)),
    );
  }
}
