import 'package:flutter/material.dart';
import 'package:mc_picker/widgets/roll_widget.dart';

class MCPicker extends StatefulWidget {
  const MCPicker({
    required this.onDateChanged,
    super.key,
  });

  final ValueChanged<DateTime> onDateChanged;

  @override
  State<MCPicker> createState() => _MCPickerState();
}

class _MCPickerState extends State<MCPicker> {
  int _viewDayIndex = 0;
  int _viewMonthIndex = 0;
  int _viewYearIndex = 0;
  var _days = List.generate(31, (index) => '${1 + index}');
  final _years = List.generate(24, (index) => '${2000 + index}');
  final _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF35406C),
                        Color(0xFF182144),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6FF7D).withOpacity(0.05),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setState) => RollWidget(
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _viewDayIndex = value;
                            });
                          },
                          viewIndex: _viewDayIndex,
                          values: _days,
                          offAxisFraction: -1.2,
                          align: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setState) => RollWidget(
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _viewMonthIndex = value;
                            });
                          },
                          viewIndex: _viewMonthIndex,
                          values: _months,
                        ),
                      ),
                    ),
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setState) => RollWidget(
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _viewYearIndex = value;
                            });
                          },
                          viewIndex: _viewYearIndex,
                          values: _years,
                          offAxisFraction: 1.2,
                          align: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final selectedDay = int.tryParse(_days[_viewDayIndex]) ?? 0;
                final selectedMonth = _viewMonthIndex;
                final selectedYear = int.tryParse(_years[_viewYearIndex]) ?? 0;
                final date = DateTime(selectedYear, selectedMonth, selectedDay);
                widget.onDateChanged(date);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD6FF7D),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0C1A4D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
