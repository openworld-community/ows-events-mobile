import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/bottom_sheet_with_scuffold.dart';
import 'package:ows_events_mobile/features/filters/domain/price_currency.dart';
import 'package:ows_events_mobile/features/filters/presentation/dates_filter.dart';
import 'package:ows_events_mobile/features/filters/presentation/filter_section.dart';
import 'package:ows_events_mobile/features/filters/presentation/price_currency_filter.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWithScuffold(
      titleText: "filtersTitle".tr(),
      onApplyPressed: () {
        // TODO: добавить обработчик при нажатии Применить
        throw UnimplementedError(
            'не реализован функционал на нажатии на Применить');
      },
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
              onChanged: (DateTimeRange dates) {
                // TODO: добавить обработку при сохранении диапазона дат
              },
            ),
          ),
          const SizedBox(
            height: AppTheme.padding * 2,
          ),
          FilterSection(
            title: 'selectPriceTitle'.tr(),
            child: PriceCurrencyFilter(
              onChanged: (PriceCurrency priceCurrency) {
                // TODO: добавить сохранение выбранных стоимости и валюты в провайдер
                print(
                    'price and currency ${priceCurrency.price} ${priceCurrency.currency}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
