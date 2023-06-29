import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/filters_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/features/events/presentation/events_screen.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_list_screen.dart';
import 'package:ows_events_mobile/features/main/data/filter_button_provider.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    EventsScreen(),
    FavoriteEventsListScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final int menuIndex = ref.watch(pageIndexProvider) ?? 0;

    return MaxWidthContainer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мероприятия'),
          centerTitle: true,
          leading: Container(
            padding: const EdgeInsets.all(15),
            child: const Logo(),
          ),
          leadingWidth: 100,
          actions: [
            FiltersIconButton(
              onPressed: () => ref.read(filterButtonProvider.notifier).state =
                  !ref.read(filterButtonProvider),
            ),
          ],
        ),
        body: PageView(
          controller: controller,
          children: screens,
          onPageChanged: (index) =>
              ref.read(pageIndexProvider.notifier).update((state) => index),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: menuIndex,
          onDestinationSelected: (int index) {
            ref.read(pageIndexProvider.notifier).update((state) => index);
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.local_activity),
              icon: Icon(Icons.local_activity_outlined),
              label: 'Афиша',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: 'Избранное',
            ),
          ],
        ),
      ),
    );
  }
}
