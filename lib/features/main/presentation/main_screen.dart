import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/features/events/presentation/events_screen.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_screen.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    EventsScreen(),
    FavoriteEventsScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final int menuIndex = ref.watch(pageIndexProvider) ?? 0;

    return MaxWidthContainer(
      child: Scaffold(
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
          destinations: <NavigationDestination>[
            NavigationDestination(
              selectedIcon: const Icon(Icons.local_activity),
              icon: const Icon(Icons.local_activity_outlined),
              label: 'billboardTab'.tr(),
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.favorite),
              icon: const Icon(Icons.favorite_outline),
              label: 'favoritesTab'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
