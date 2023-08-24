import 'package:flutter/material.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppTheme.padding),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.padding),
            child: child,
          ),
        ),
      ],
    );
  }
}
