import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    this.selected,
    required this.onPressed,
  });

  final bool? selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: selected == true ? Theme.of(context).colorScheme.primary : null,
      ),
      onPressed: onPressed,
    );
  }
}
