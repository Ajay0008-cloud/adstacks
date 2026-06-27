import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/app_theme.dart';

class RightWidgetPanel extends StatefulWidget {
  final bool isEmbeddedInScroll;

  const RightWidgetPanel({
    super.key,
    this.isEmbeddedInScroll = false,
  });

  @override
  State<RightWidgetPanel> createState() => _RightWidgetPanelState();
}

class _RightWidgetPanelState extends State<RightWidgetPanel> {
  DateTime _focusedDay = DateTime(2023, 9, 15);
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime(2023, 9, 15);
  }

  @override
  Widget build(BuildContext context) {
    final panelWidth = widget.isEmbeddedInScroll ? double.infinity : 310.0;

    return Container(
      width: panelWidth,
      color: AppTheme.darkNavy,
      child: ListView(
        shrinkWrap: widget.isEmbeddedInScroll,
        physics: widget.isEmbeddedInScroll ? const NeverScrollableScrollPhysics() : null,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        children: [
          // Shift Time Header Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.darkNavyCard,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'GENERAL 10:00 AM TO 7:00 PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Calendar Widget matching image style
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.darkNavyCard,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white70, size: 18),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white70, size: 18),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(color: Colors.white70, fontSize: 11),
                weekendTextStyle: const TextStyle(color: Colors.white70, fontSize: 11),
                outsideTextStyle: TextStyle(color: Colors.white.withValues(alpha: 0.2), fontSize: 11),
                selectedDecoration: const BoxDecoration(
                  color: AppTheme.primaryPurple,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppTheme.coralPink.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: AppTheme.textMuted, fontSize: 10, fontWeight: FontWeight.bold),
                weekendStyle: TextStyle(color: AppTheme.textMuted, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Today Birthday Card Widget
          _buildCelebrationCard(
            context: context,
            title: 'Today Birthday',
            count: 2,
            buttonText: 'Birthday Wishing',
            buttonColor: AppTheme.primaryPurple,
            countBg: Colors.white12,
          ),
          const SizedBox(height: 18),

          // Anniversary Card Widget
          _buildCelebrationCard(
            context: context,
            title: 'Anniversary',
            count: 3,
            buttonText: 'Anniversary Wishing',
            buttonColor: AppTheme.primaryPurple,
            countBg: Colors.white12,
          ),
        ],
      ),
    );
  }

  Widget _buildCelebrationCard({
    required BuildContext context,
    required String title,
    required int count,
    required String buttonText,
    required Color buttonColor,
    required Color countBg,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.darkNavyCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.stars_rounded, color: AppTheme.goldStar, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Row with Avatars and Total Count Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Avatars Stack / Row
              SizedBox(
                height: 34,
                width: 80,
                child: Stack(
                  children: List.generate(count > 3 ? 3 : count, (index) {
                    return Positioned(
                      left: index * 20.0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppTheme.darkNavyCard,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: index == 0 ? Colors.purpleAccent : (index == 1 ? Colors.indigoAccent : Colors.tealAccent),
                          child: const Icon(Icons.person_rounded, color: Colors.white, size: 16),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Total Count Pill matching image `Total | 2 |`
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: countBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text('Total', style: TextStyle(color: Colors.white60, fontSize: 11)),
                    const SizedBox(width: 6),
                    const Text('|', style: TextStyle(color: Colors.white38, fontSize: 11)),
                    const SizedBox(width: 6),
                    Text('$count', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 6),
                    const Text('|', style: TextStyle(color: Colors.white38, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                _showWishingDialog(context, title, buttonText);
              },
              icon: const Icon(Icons.send_rounded, size: 14),
              label: Text(
                buttonText,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showWishingDialog(BuildContext context, String type, String action) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.darkNavyCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.auto_awesome, color: AppTheme.goldStar),
            const SizedBox(width: 10),
            Text('Send $type Wish', style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        content: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Write your warm wishes...',
            hintStyle: TextStyle(color: Colors.white38),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primaryPurple)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel', style: TextStyle(color: Colors.white60)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryPurple),
            onPressed: () {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppTheme.tealAccent,
                  content: Text('🎉 Your $type wishes have been sent successfully!'),
                ),
              );
            },
            child: const Text('Send Wish', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
