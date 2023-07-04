import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(
      {super.key, required this.onPressed, required this.favorite});

  final VoidCallback onPressed;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          favorite
              ? Theme.of(context).dividerColor
              : Theme.of(context).colorScheme.primaryContainer,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          const Size(200, 40),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 7,
          ),
        ),
      ),
      child: Text(
        favorite ? 'favoriteButtonDelete'.tr() : 'favoriteButtonAdd'.tr(),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: favorite
                  ? Theme.of(context).textTheme.bodyLarge?.color
                  : Colors.white,
            ),
      ),
    );
  }
}
