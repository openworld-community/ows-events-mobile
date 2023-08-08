import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class FiltersIconButton extends StatelessWidget {
  const FiltersIconButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        FontAwesome5.sliders_h,
        size: 20,
      ),
    );
  }
}
