import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({
    super.key,
    required this.items,
    required this.onChanged,
  });

  final Map<String, String> items;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text('currency'.tr()),
      items: _getDropdownMenuItems(items),
      onChanged: onChanged,
    );
  }

  List<DropdownMenuItem<String>> _getDropdownMenuItems(
      Map<String, String> entities) {
    return entities.entries
        .map((entity) => DropdownMenuItem<String>(
              value: entity.key,
              child: Text(entity.value),
            ))
        .toList();
  }
}
