import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/date_picker_field.dart';

class DatesFilter extends StatelessWidget {
  const DatesFilter({
    super.key,
    required this.onChanged,
  });

  final void Function(DateTimeRange) onChanged;

  @override
  Widget build(BuildContext context) {
    return DatePickerField(onSave: onChanged);
  }
}
