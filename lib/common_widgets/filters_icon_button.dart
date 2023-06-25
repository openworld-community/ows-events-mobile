import 'package:flutter/material.dart';

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
      icon: const Icon(Icons.search),
    );
  }
}
