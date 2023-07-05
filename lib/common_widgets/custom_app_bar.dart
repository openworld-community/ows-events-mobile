import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/filters_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/common_widgets/search_field.dart';
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
  bool _searchShown = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _searchShown
          ? SearchField(
              onChange: (value) {},
              onClose: () {
                setState(() {
                  _searchShown = false;
                });
              },
            )
          : Text('mainScreenTitle'.tr()),
      centerTitle: true,
      titleSpacing: 0,
      leading: !_searchShown
          ? Container(
              padding: const EdgeInsets.all(15),
              child: const Logo(),
            )
          : null,
      leadingWidth: !_searchShown ? 100 : 0,
      actions: [
        if (!_searchShown)
          SearchIconButton(onPressed: () {
            setState(() {
              _searchShown = true;
            });
          }),
        if (widget.onFilterIconButtomPressed != null)
          FiltersIconButton(
            onPressed: widget.onFilterIconButtomPressed!,
          ),
      ],
    );
  }
}
