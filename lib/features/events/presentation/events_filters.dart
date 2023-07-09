import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/date_picker_field.dart';
import 'package:ows_events_mobile/features/locations/data/api/locations_collector.dart';
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
  LocationsCollector? _locationsCollector;
  List<String>? _countriesList;
  List<String>? _citiesList;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      _locationsCollector = await ref.read(locationsCollectorProvider.future);

      setState(() {
        _countriesList = _locationsCollector!.getCountries();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isShowFilterButton = ref.watch(filterButtonProvider);
    final GlobalKey<FormState> citiesKey = GlobalKey<FormState>();

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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                hint: Text('country'.tr()),
                                items: _getDropdownMenuItems(_countriesList),
                                onChanged: (value) {
                                  if (_locationsCollector != null) {
                                    final List<String> citiesList =
                                        _locationsCollector!
                                            .getCitiesForCountry(value);
                                    setState(() {
                                      _citiesList = citiesList;
                                    });
                                  }

                                  citiesKey.currentState?.reset();
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
                                items: _getDropdownMenuItems(_citiesList),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: DatePickerField(
                                onSave: _onDateRangeSave,
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

  void _onDateRangeSave(DateTimeRange dateTimeRange) {
    // TODO: добавить сохранение дат в провайдер
  }
}
