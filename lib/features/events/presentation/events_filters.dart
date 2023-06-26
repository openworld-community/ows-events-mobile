import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main/presentation/filter_button_provaider.dart';

class EventsFilters extends ConsumerWidget {
  const EventsFilters({
    super.key,
    required this.onSearchTextChanged,
    required this.onCountryTextChanged,
    required this.onCityTextChanged,
  });

  final void Function(String) onSearchTextChanged;
  final void Function(String) onCountryTextChanged;
  final void Function(String) onCityTextChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowFilterButton = ref.watch(filterButtonProvider);
    return Column(
      children: [
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
                ? Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          onChanged: onSearchTextChanged,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 30.0,
                              color: Colors.grey,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 12, 12, 12),
                            hintText: 'Поиск',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                onChanged: onCountryTextChanged,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30.0,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(15, 12, 12, 12),
                                  hintText: 'Страна',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextField(
                                onChanged: onCityTextChanged,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30.0,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(15, 12, 12, 12),
                                  hintText: 'Город',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
