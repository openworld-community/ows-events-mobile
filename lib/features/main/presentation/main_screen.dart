import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/info_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/features/events/presentation/events_screen.dart';
import 'package:ows_events_mobile/features/favourites/presentation/favourites_screen.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    EventsScreen(),
    FavouritesListScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallSizeScreen = screenSize.width <= 500;
    final PageController controller = PageController();
    final int menuIndex = ref.watch(indexProvider) as int;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : 500,
          child: Scaffold(
            appBar: AppBar(
              leading: const Logo(),
              leadingWidth: 150,
              actions: const [
                Text("30 дней"),
                InfoIconButton(),
              ],
            ),
            body: PageView(
                controller: controller,
                children: screens,
                onPageChanged: (index) =>
                    ref.read(indexProvider.notifier).value = index,
                    ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: menuIndex,
              onDestinationSelected: (int index) {
                ref.read(indexProvider.notifier).value = index;
                controller.animateToPage(index,
                    duration: const Duration(seconds: 1),
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
        ),
      ),
    );
  }
}
