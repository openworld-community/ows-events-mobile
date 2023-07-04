import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/filters_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/common_widgets/search_icon_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onFilterIconButtomPressed,
  });

  final VoidCallback? onFilterIconButtomPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Мероприятия'),
      centerTitle: true,
      leading: Container(
        padding: const EdgeInsets.all(15),
        child: const Logo(),
      ),
      leadingWidth: 100,
      actions: [
        SearchIconButton(onPressed: () {}),
        if (widget.onFilterIconButtomPressed != null)
          FiltersIconButton(
            onPressed: widget.onFilterIconButtomPressed!,
          ),
      ],
    );
  }
}
