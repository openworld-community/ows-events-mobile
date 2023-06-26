import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main/presentation/filter_button_provaider.dart';
import 'events_filters.dart';

class AnimationEventsFilters extends ConsumerWidget {
  const AnimationEventsFilters({
    super.key,
    required this.onSearchTextChanged,
    required this.onCountryTextChanged,
    required this.onCityTextChanged,
  });

  final void Function(String) onSearchTextChanged;
  final void Function(String) onCountryTextChanged;
  final void Function(String) onCityTextChanged;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final isShowFilterButton = ref.watch(filterButtonProvider);
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Text(
            'Мероприятия',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, -0.1),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
            child: isShowFilterButton
                ? EventsFilters(
                    onSearchTextChanged: onSearchTextChanged,
                    onCountryTextChanged: onCountryTextChanged,
                    onCityTextChanged: onCityTextChanged,
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
