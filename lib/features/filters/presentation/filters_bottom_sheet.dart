import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/bottom_sheet_with_scuffold.dart';
import 'package:ows_events_mobile/features/filters/data/filters_providers.dart';
import 'package:ows_events_mobile/features/filters/domain/price_currency.dart';
import 'package:ows_events_mobile/features/filters/presentation/dates_filter.dart';
import 'package:ows_events_mobile/features/filters/presentation/filter_section.dart';
import 'package:ows_events_mobile/features/filters/presentation/price_currency_filter.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class FiltersBottomSheet extends ConsumerStatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  ConsumerState<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends ConsumerState<FiltersBottomSheet> {
  List<Category>? _categories;
  DateTimeRange? _datesRange;
  PriceCurrency? _priceCurrency;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWithScuffold(
      titleText: "filtersTitle".tr(),
      onApplyPressed: _saveFilters,
      onClosing: () {
        // TODO: добавить обработчик при закрытии
        throw UnimplementedError(
            'не реализован функционал на закрытие фильтров');
      },
      child: Column(
        children: [
          FilterSection(
            title: 'selectCategoriesTitle'.tr(),
            child: const Placeholder(
              child: Center(
                child: Text('Список категорий'),
              ),
            ),
          ),
          const SizedBox(
            height: AppTheme.padding * 2,
          ),
          FilterSection(
            title: 'selectDatesTitle'.tr(),
            child: DatesFilter(
              onChanged: _setDatesRange,
            ),
          ),
          const SizedBox(
            height: AppTheme.padding * 2,
          ),
          FilterSection(
            title: 'selectPriceTitle'.tr(),
            child: PriceCurrencyFilter(
              onChanged: _setPriceCurrency,
            ),
          ),
        ],
      ),
    );
  }

  void _setDatesRange(DateTimeRange dates) {
    setState(() {
      _datesRange = dates;
    });
  }

  void _setPriceCurrency(PriceCurrency priceCurrency) {
    setState(() {
      _priceCurrency = priceCurrency;
    });
  }

  void _saveFilters() {
    if (_categories != null && _categories!.isNotEmpty) {
      ref
          .read(categoriesFilterProvider.notifier)
          .update((state) => _categories);
    }

    if (_datesRange != null) {
      ref
          .read(datesRangeFilterProvider.notifier)
          .update((state) => _datesRange);
    }

    if (_priceCurrency != null) {
      ref
          .read(priceCurrencyFilterProvider.notifier)
          .update((state) => _priceCurrency);
    }
  }
}
