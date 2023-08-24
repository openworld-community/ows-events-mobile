import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/bottom_sheet_with_scuffold.dart';
import 'package:ows_events_mobile/features/filters/presentation/filter_section.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class CountryCityBottomSheet extends StatelessWidget {
  const CountryCityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWithScuffold(
      titleText: "countryCityTitle".tr(),
      onApplyPressed: () {
        // TODO: добавить обработчик при нажатии Применить
        throw UnimplementedError(
            'не реализован функционал на нажатии на Применить');
      },
      onClosing: () {
        // TODO: добавить обработчик при закрытии
        throw UnimplementedError(
            'не реализован функционал на закрытие выбора страны и города');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSection(
            title: 'selectCountryTitle'.tr(),
            child: const Placeholder(
              child: Center(
                child: Text('Список стран'),
              ),
            ),
          ),
          const SizedBox(
            height: AppTheme.padding * 2,
          ),
          FilterSection(
            title: 'selectCityTitle'.tr(),
            child: const Placeholder(
              child: Center(
                child: Text('Список городов'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
