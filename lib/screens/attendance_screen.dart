import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AttendanceRecord {
  final String date;
  final String checkIn;
  final String checkOut;
  final String workHours;
  final String status;

  AttendanceRecord({
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.workHours,
    required this.status,
  });
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool _isCheckedIn = true;
  final String _lastCheckInTime = '09:58 AM';

  final List<AttendanceRecord> _records = [
    AttendanceRecord(date: 'Jun 27, 2026', checkIn: '09:58 AM', checkOut: '--:--', workHours: '3h 10m (Active)', status: 'On Time'),
    AttendanceRecord(date: 'Jun 26, 2026', checkIn: '10:02 AM', checkOut: '07:05 PM', workHours: '9h 03m', status: 'On Time'),
    AttendanceRecord(date: 'Jun 25, 2026', checkIn: '10:15 AM', checkOut: '07:12 PM', workHours: '8h 57m', status: 'Late Check-in'),
    AttendanceRecord(date: 'Jun 24, 2026', checkIn: '09:55 AM', checkOut: '07:00 PM', workHours: '9h 05m', status: 'On Time'),
    AttendanceRecord(date: 'Jun 23, 2026', checkIn: '10:00 AM', checkOut: '07:02 PM', workHours: '9h 02m', status: 'On Time'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Punch Clock Banner Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: AppTheme.bannerGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryPurple.withValues(alpha: 0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Attendance Punch System',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _isCheckedIn ? 'Checked in today at $_lastCheckInTime' : 'Not checked in yet today',
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() => _isCheckedIn = !_isCheckedIn);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isCheckedIn ? 'Checked IN successfully!' : 'Checked OUT successfully!'),
                    ),
                  );
                },
                icon: Icon(_isCheckedIn ? Icons.logout_rounded : Icons.login_rounded, size: 18),
                label: Text(_isCheckedIn ? 'Punch Out' : 'Punch In'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCheckedIn ? AppTheme.coralPink : AppTheme.darkNavy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // History Log Section Header
        const Text(
          'Recent Attendance Log',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkNavy),
        ),
        const SizedBox(height: 14),

        // Attendance Table Container
        Container(
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
          child: Column(
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textMuted))),
                    Expanded(flex: 2, child: Text('Check In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textMuted))),
                    Expanded(flex: 2, child: Text('Check Out', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textMuted))),
                    Expanded(flex: 2, child: Text('Work Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textMuted))),
                    Expanded(flex: 2, child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textMuted))),
                  ],
                ),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              ..._records.map((rec) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Text(rec.date, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkNavy))),
                        Expanded(flex: 2, child: Text(rec.checkIn, style: const TextStyle(fontSize: 13, color: AppTheme.textDark))),
                        Expanded(flex: 2, child: Text(rec.checkOut, style: const TextStyle(fontSize: 13, color: AppTheme.textDark))),
                        Expanded(flex: 2, child: Text(rec.workHours, style: const TextStyle(fontSize: 13, color: AppTheme.primaryPurple, fontWeight: FontWeight.w500))),
                        Expanded(flex: 2, child: _buildStatusPill(rec.status)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusPill(String status) {
    final isLate = status.contains('Late');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (isLate ? AppTheme.coralPink : AppTheme.tealAccent).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isLate ? AppTheme.coralPink : AppTheme.tealAccent,
        ),
      ),
    );
  }
}
