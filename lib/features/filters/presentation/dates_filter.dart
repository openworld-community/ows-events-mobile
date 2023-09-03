import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/date_picker_field.dart';

class DatesFilter extends StatelessWidget {
  const DatesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePickerField(onSave: (DateTimeRange dates) {
      // TODO: добавить обработку при сохранении диапазона дат
    });
  }
}
