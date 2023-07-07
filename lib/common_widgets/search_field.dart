import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChange,
    required this.onClose,
  });

  final void Function(String) onChange;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChange,
            decoration: InputDecoration(
              filled: false,
              prefixIconColor: Theme.of(context).colorScheme.primary,
              prefixIcon: const Icon(
                Icons.search,
                size: 25.0,
              ),
              hintText: 'search'.tr(),
            ),
          ),
        ),
        IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
