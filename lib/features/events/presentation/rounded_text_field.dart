import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_events_mobile/resources/text_styles.dart';

import '../../../resources/colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final IconData? suffixIcon;
  final VoidCallback? onPressedIcon;
  final String text;
  final Function(String) onTextChanged;

  const RoundedTextField(
      {super.key,
      this.hintText = '',
      this.keyboardType = TextInputType.none,
      this.inputFormatters,
      this.maxLines = 1,
      this.minLines = 1,
      this.suffixIcon,
      this.onPressedIcon,
      required this.text,
      required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.inputTextStyle,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters ?? [],
      onChanged: (text) => {onTextChanged(text)},
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
                color: AppColors.accent,
                width: 1.0,
              )),
          suffixIcon: text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    onTextChanged('');
                  },
                  icon: const Icon(Icons.cancel),
                )
              : suffixIcon != null && onPressedIcon != null
                  ? IconButton(onPressed: onPressedIcon, icon: Icon(suffixIcon))
                  : suffixIcon != null
                      ? Icon(suffixIcon)
                      : null,
          suffixIconColor: Colors.grey),
    );
  }
}