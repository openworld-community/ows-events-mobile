import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';
import 'package:ows_events_mobile/features/filters/presentation/country_city_bottom_sheet.dart';
import 'package:ows_events_mobile/features/filters/presentation/filters_bottom_sheet.dart';
import 'package:ows_events_mobile/features/home/presentation/home_app_bar.dart';
import 'package:ows_events_mobile/features/home/presentation/home_event_card.dart';
import 'package:ows_events_mobile/features/home/presentation/home_section.dart';
import 'package:ows_events_mobile/features/home/presentation/home_section_title.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: фейковый эвент для теста карты события. После прикрутки реальных данных надо убрать
    final Event fakeEvent = Event(
      id: '1',
      title: 'Peredelato Conf Tbilisi',
      description: '',
      date: DateTime.now(),
      duration: const Duration(hours: 1),
      location: const Location(country: 'Georgia', city: 'Tbilisi'),
      priceMin: null,
      priceFix: '100',
      priceMax: null,
      priceCurrency: 'GEL',
      url: '',
      image: 'assets/image_event_placeholder.png',
      tags: ['Конференция'],
    );

    return Scaffold(
      appBar: HomeAppBar(
        onFilterPressed: () => Scaffold.of(context)
            .showBottomSheet((context) => const FiltersBottomSheet()),
        onLocationPressed: () => Scaffold.of(context)
            .showBottomSheet((context) => const CountryCityBottomSheet()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppTheme.padding * 2),
          child: Column(
            children: [
              HomeSection(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSectionTitle(titleText: "meetupsTitle".tr()),
                    HomeSectionTitle(
                      titleText: "Peredelano",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
                viewAllColor: Theme.of(context).colorScheme.secondary,
                onMoreTap: () {
                  // TODO: реализовать переход на полный список митапов переделано
                  throw UnimplementedError(
                      'Переход на полный список митапов не реализован.');
                },
                child: SizedBox(
                  // Блок-заглушка, будет заменен на актуальную карусель событий.
                  height: 208,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      Row(
                        children: [
                          HomeEventCard(
                            imagePath: fakeEvent.image!,
                            title: fakeEvent.title,
                            date: fakeEvent.date!,
                            categories: fakeEvent.tags,
                            wide: true,
                          ),
                          const SizedBox(width: AppTheme.padding),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              HomeSection(
                titleText: "todayEventsTitle".tr(),
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий за сегодня
                  throw UnimplementedError(
                      'Переход на полный список событий за сегодня не реализован.');
                },
                child: SizedBox(
                  // Блок-заглушка, будет заменен на актуальную карусель событий.
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      Row(
                        children: [
                          HomeEventCard(
                            imagePath: fakeEvent.image!,
                            title: fakeEvent.title,
                            date: fakeEvent.date!,
                            categories: fakeEvent.tags,
                          ),
                          const SizedBox(width: AppTheme.padding),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              HomeSection(
                titleText: "weekEventsTitle".tr(),
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий этой недели
                  throw UnimplementedError(
                      'Переход на полный список событий этой недели не реализован.');
                },
                child: SizedBox(
                  // Блок-заглушка, будет заменен на актуальную карусель событий.
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      const Row(
                        children: [
                          SizedBox(
                            width: 240,
                            height: 240,
                            child: Placeholder(
                              child: Text('Событие недели'),
                            ),
                          ),
                          SizedBox(width: AppTheme.padding),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              HomeSection(
                titleText: "monthEventsTitle".tr(),
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий в этом месяце
                  throw UnimplementedError(
                      'Переход на полный список событий этого месяца не реализован.');
                },
                child: SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      const Row(
                        children: [
                          SizedBox(
                            width: 240,
                            height: 240,
                            child: Placeholder(
                              child: Text('Событие месяца'),
                            ),
                          ),
                          SizedBox(width: AppTheme.padding),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              HomeSection(
                titleText: "categoryTitle".tr(),
                viewAllText: "goTo".tr(),
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий ???
                  throw UnimplementedError(
                      'Переход на полный список событий ???');
                },
                child: SizedBox(
                  // Блок-заглушка, будет заменен на актуальную карусель событий.
                  height: 136,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      const Row(
                        children: [
                          SizedBox(
                            width: 136,
                            height: 136,
                            child: Placeholder(
                              child: Text('Категория'),
                            ),
                          ),
                          SizedBox(width: AppTheme.padding),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
