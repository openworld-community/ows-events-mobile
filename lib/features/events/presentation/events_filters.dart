import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/date_picker_field.dart';
import 'package:ows_events_mobile/features/locations/data/api/locations_collector.dart';
import 'package:ows_events_mobile/features/main/data/filter_button_provider.dart';

class EventsFilters extends ConsumerStatefulWidget {
  const EventsFilters({
    super.key,
    required this.onCountrySelected,
    required this.onCitySelected,
    required this.onDatesSelected,
  });

  final void Function(String?) onCountrySelected;
  final void Function(String?) onCitySelected;
  final void Function(DateTimeRange) onDatesSelected;

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
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text('country'.tr()),
                                items: _getDropdownMenuItems(_countriesList),
                                onChanged: (value) {
                                  _updateCitiesList(value);
                                  widget.onCountrySelected(value);
                                  citiesKey.currentState?.reset();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField<String>(
                                key: citiesKey,
                                isExpanded: true,
                                hint: Text('city'.tr()),
                                items: _getDropdownMenuItems(_citiesList),
                                onChanged: (value) {
                                  widget.onCitySelected(value);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: DatePickerField(
                                onSave: widget.onDatesSelected,
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

  List<DropdownMenuItem<String>> _getDropdownMenuItems(
      List<String>? entitiesList) {
    if (entitiesList == null) return [];

    return entitiesList
        .map((entity) => DropdownMenuItem<String>(
              value: entity,
              child: Text(entity),
            ))
        .toList();
  }

  void _updateCitiesList(String? value) {
    if (value == null) return;

    if (_locationsCollector != null) {
      final List<String> citiesList =
          _locationsCollector!.getCitiesForCountry(value);
      setState(() {
        _citiesList = citiesList;
      });
    }
  }
}
