import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChange,
    this.onClose,
  });

  final void Function(String) onChange;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChange,
            style: TextStyle(
              color: Colors.grey[500],
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIconColor: Colors.grey[400],
              prefixIcon: const Icon(
                Icons.search_sharp,
                size: 25.0,
              ),
              hintText: 'search'.tr(),
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        if (onClose != null)
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
          ),
      ],
    );
  }
}
