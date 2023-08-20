import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/home/presentation/home_app_bar.dart';
import 'package:ows_events_mobile/features/home/presentation/home_section.dart';
import 'package:ows_events_mobile/features/home/presentation/home_section_title.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppTheme.padding * 2),
          child: Column(
            children: [
              HomeSection(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeSectionTitle(titleText: "Митапы"),
                    HomeSectionTitle(
                      titleText: "Peredelano",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
                moreColor: Theme.of(context).colorScheme.secondary,
                onMoreTap: () {
                  // TODO: реализовать переход на полный список митапов переделано
                  throw UnimplementedError(
                      'Переход на полный список митапов не реализован.');
                },
                child: SizedBox(
                  height: 208,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.filled(
                      3,
                      const Row(
                        children: [
                          SizedBox(
                            width: 304,
                            height: 208,
                            child: Placeholder(
                              child: Text('Митапы Peredelano'),
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
                titleText: "Сегодня",
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий за сегодня
                  throw UnimplementedError(
                      'Переход на полный список событий за сегодня не реализован.');
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
                              child: Text('Событие Сегодня'),
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
                titleText: "На этой неделе",
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий этой недели
                  throw UnimplementedError(
                      'Переход на полный список событий этой недели не реализован.');
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
                titleText: "В этом месяце",
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
                titleText: "Категории",
                moreText: "Перейти",
                onMoreTap: () {
                  // TODO: реализовать переход на полный список событий ???
                  throw UnimplementedError(
                      'Переход на полный список событий ???');
                },
                child: SizedBox(
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
