import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/main/data/filter_button_provider.dart';

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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1),
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
          child: isShowFilterButton
              ? Container(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          onChanged: onSearchTextChanged,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              size: 25.0,
                              color: Colors.grey,
                            ),
                            hintText: 'Поиск',
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const DropdownMenu(
                              hintText: 'Страна',
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                  value: '1',
                                  label: 'country 1',
                                ),
                                DropdownMenuEntry(
                                  value: '2',
                                  label: 'country 2',
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const DropdownMenu(
                              hintText: 'Город',
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                  value: '1',
                                  label: 'city 1',
                                ),
                                DropdownMenuEntry(
                                  value: '2',
                                  label: 'city 2',
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Даты',
                                ),
                                readOnly: true,
                                onTap: () => showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(
                                      days: 365,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
