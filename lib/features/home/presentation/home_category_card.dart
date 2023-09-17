import 'package:flutter/material.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.gradient,
    this.onTap,
  });

  final IconData iconData;
  final String title;
  final LinearGradient gradient;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: gradient,
        ),
        padding: const EdgeInsets.all(AppTheme.padding),
        width: 136,
        height: 136,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              size: 28,
              color: textColor,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
