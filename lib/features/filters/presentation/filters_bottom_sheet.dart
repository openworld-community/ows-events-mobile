import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/bottom_sheet_with_scuffold.dart';
import 'package:ows_events_mobile/features/filters/presentation/dates_filter.dart';
import 'package:ows_events_mobile/features/filters/presentation/filter_section.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';
import 'categories.dart';




class FiltersBottomSheet extends StatelessWidget {
  FiltersBottomSheet({super.key});
  List<Map> CategoriesData = CategoriesList.data;
  Map<int, bool> CategoriesCheck = {};


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
            child: Placeholder(
              child: Center(
                child:
                ListView.builder(
                  itemCount: CategoriesData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          title: Text(CategoriesData[index]['title']),
                          value: CategoriesData[index]['checked'], 
                          onChanged: (bool? value) {
                            setState(() {
                              CategoriesData[index]['checked'] = value!;
                            });
                          },
                          secondary: Image.asset("${CategoriesData[index]['logo']}"),
                        );
                      }
                    );
                    },
                
                ),

                // Text('Список категорий'),
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
            child: const Placeholder(
              child: Center(
                child: Text('Поля вобора валюты и цены'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
