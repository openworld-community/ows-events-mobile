import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/util/time_utils.dart';

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
  final String dateFormat = 'dd.MM.yy';
  final TextEditingController _controller = TextEditingController();
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'dates'.tr(),
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

        if (_selectedDateRange != null) {
          final String startDateString = TimeUtils.formatDateTime(
            _selectedDateRange!.start,
            format: dateFormat,
          );
          final String endDateString = TimeUtils.formatDateTime(
            _selectedDateRange!.end,
            format: dateFormat,
          );

          _controller.value = TextEditingValue(
            text: '$startDateString - $endDateString',
          );
          widget.onSave(_selectedDateRange!);
        } else {
          _controller.clear();
        }
      },
    );
  }
}
