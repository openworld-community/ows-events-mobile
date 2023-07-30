import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'main_screen_controller.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int menuIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: menuIndex,
        onDestinationSelected: (int index) {
          ref.read(pageIndexProvider.notifier).update((state) => index);
          _goToPage(index, context);
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
    );
  }

  void _goToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/favourites');
        break;
    }
  }
}
