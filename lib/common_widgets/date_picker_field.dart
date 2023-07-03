import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    required this.onSave,
  });

  final void Function(DateTimeRange) onSave;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _controller = TextEditingController();
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Даты',
      ),
      controller: _controller,
      readOnly: true,
      onTap: () async {
        _selectedDateRange = await showDateRangePicker(
          context: context,
          initialDateRange: _selectedDateRange,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(
              days: 365,
            ),
          ),
          builder: (context, child) => MaxWidthContainer(
            child: Scaffold(
              body: child,
            ),
          ),
        );

        _controller.value = TextEditingValue(
          text: _selectedDateRange.toString(),
        );

        if (_selectedDateRange != null) {
          widget.onSave(_selectedDateRange!);
        }
      },
    );
  }
}
