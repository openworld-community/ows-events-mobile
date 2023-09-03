import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text('price'.tr()),
      ),
      keyboardType: TextInputType.number,
      autocorrect: false,
      onChanged: onChanged,
    );
  }
}
