import 'package:flutter/material.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class MaxWidthContainer extends StatelessWidget {
  const MaxWidthContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const maxWidth = AppTheme.maxContainerWidth;
    final isSmallSizeScreen = screenSize.width <= maxWidth;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : maxWidth,
          child: child,
        ),
      ),
    );
  }
}
