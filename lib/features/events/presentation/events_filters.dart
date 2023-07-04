import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/locations_provider.dart';
import 'package:ows_events_mobile/features/main/data/filter_button_provider.dart';

class EventsFilters extends ConsumerStatefulWidget {
  const EventsFilters({
    super.key,
    required this.onSearchTextChanged,
    required this.onCityTextChanged,
  });

  final void Function(String) onSearchTextChanged;
  final void Function(String) onCityTextChanged;

  @override
  ConsumerState<EventsFilters> createState() => _EventsFiltersState();
}

class _EventsFiltersState extends ConsumerState<EventsFilters> {
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    final isShowFilterButton = ref.watch(filterButtonProvider);
    final asyncCountriesListData = ref.watch(countriesListProvider);
    final List<String>? countriesList = asyncCountriesListData.value;
    List<String>? citiesList;
    final GlobalKey<FormState> citiesKey = GlobalKey<FormState>();

    if (_selectedCountry != null) {
      final asyncCitiesListData =
          ref.watch(citiesListProvider(_selectedCountry!));
      citiesList = asyncCitiesListData.value;
    }

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
                          onChanged: widget.onSearchTextChanged,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 25.0,
                              color: Colors.grey,
                            ),
                            hintText: 'search'.tr(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                hint: Text('country'.tr()),
                                items: _getDropdownMenuItems(countriesList),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCountry = value;
                                    citiesKey.currentState?.reset();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
                                key: citiesKey,
                                isExpanded: true,
                                hint: Text('city'.tr()),
                                items: _getDropdownMenuItems(citiesList),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'dates'.tr(),
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

  List<DropdownMenuItem> _getDropdownMenuItems(List<String>? entitiesList) {
    if (entitiesList == null) return [];

    return entitiesList
        .map((country) => DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            ))
        .toList();
  }
}
