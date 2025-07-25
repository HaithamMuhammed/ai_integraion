// lib/View/widgets/date_selector_widget.dart

import 'package:flutter/material.dart';

class DateSelectorWidget extends StatelessWidget {
  final int selectedDayIndex;
  final ValueChanged<int> onDaySelected;

  const DateSelectorWidget({
    super.key,
    required this.selectedDayIndex,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> days = [
      {'day': "Sun", 'date': "6"},
      {'day': "Mon", 'date': "7"},
      {'day': "Tue", 'date': "8"},
      {'day': "Wid", 'date': "9"},
      {'day': "Fri", 'date': "10"},
      {'day': "Sat", 'date': "11"},
      {'day': "Sun", 'date': "12"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A54),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(days.length, (index) {
          final dayData = days[index];
          return GestureDetector(
            onTap: () => onDaySelected(index), // Call the callback
            child: _DateItem(
              day: dayData['day']!,
              date: dayData['date']!,
              isSelected: selectedDayIndex == index,
            ),
          );
        }),
      ),
    );
  }
}

// Private helper widget for individual date items
class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const _DateItem({
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}