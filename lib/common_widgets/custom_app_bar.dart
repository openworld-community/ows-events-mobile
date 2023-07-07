import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/filters_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/common_widgets/search_field.dart';
import 'package:ows_events_mobile/common_widgets/search_icon_button.dart';
import 'package:ows_events_mobile/features/main/data/filter_button_provider.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onSearch,
    this.withFilters,
  });

  final String title;
  final void Function(String)? onSearch;
  final bool? withFilters;

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBar extends ConsumerState<CustomAppBar> {
  bool _searchShown = false;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(widget.title);

    if (widget.onSearch != null) {
      titleWidget = _searchShown
          ? SearchField(
              onChange: widget.onSearch!,
              onClose: () {
                setState(() {
                  _searchShown = false;
                });
              },
            )
          : titleWidget;
    }
    return AppBar(
      title: titleWidget,
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
        if (widget.onSearch != null && !_searchShown)
          SearchIconButton(onPressed: () {
            setState(() {
              _searchShown = true;
            });
          }),
        if (widget.withFilters != null)
          FiltersIconButton(
            onPressed: _toggleFilter,
          ),
      ],
    );
  }

  void _toggleFilter() {
    ref.read(filterButtonProvider.notifier).state =
        !ref.read(filterButtonProvider);
  }
}
