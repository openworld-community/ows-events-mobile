import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/current_location.dart';
import 'package:ows_events_mobile/common_widgets/filters_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/notification_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/search_field.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onFilterPressed,
    required this.onLocationPressed,
  });

  final VoidCallback onFilterPressed;
  final VoidCallback onLocationPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(AppTheme.padding),
        child: CurrentLocation(
          onLocationPressed: onLocationPressed,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(AppTheme.padding),
          child: NotificationIconButton(),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppTheme.padding,
            AppTheme.padding - 5,
            AppTheme.padding,
            AppTheme.padding,
          ),
          child: Row(
            children: [
              Expanded(
                child: SearchField(
                  onChange: (String value) {
                    throw UnimplementedError();
                  },
                ),
              ),
              const SizedBox(width: 18),
              FiltersIconButton(onPressed: onFilterPressed),
            ],
          ),
        ),
      ),
      leadingWidth: 300,
      toolbarHeight: 85,
      shape: LinearBorder.bottom(
        size: 1,
        side: BorderSide(
          color: Colors.grey[400]!,
        ),
      ),
      shadowColor: Colors.grey[300],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 150);
}
