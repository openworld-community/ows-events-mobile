import 'package:flutter/material.dart';
import 'package:ows_events_mobile/features/home/presentation/home_section_title.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    this.title,
    this.titleText,
    required this.child,
    this.viewAllColor,
    this.viewAllText,
    this.onMoreTap,
  });

  final Widget? title;
  final String? titleText;
  final Widget child;
  final Color? viewAllColor;
  final String? viewAllText;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppTheme.padding,
        AppTheme.padding,
        0,
        AppTheme.padding * 2,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppTheme.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (title != null) title!,
                if (titleText != null && title == null)
                  HomeSectionTitle(titleText: titleText!),
                if (title == null && titleText == null) const SizedBox.shrink(),
                if (onMoreTap != null)
                  TextButton(
                    onPressed: onMoreTap,
                    child: Text(
                      viewAllText ?? '',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: viewAllColor ??
                                Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppTheme.padding),
            child: child,
          ),
        ],
      ),
    );
  }
}
