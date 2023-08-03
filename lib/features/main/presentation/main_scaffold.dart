import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
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

    ref.listen(
      pageIndexProvider,
      (previous, current) {
        switch (current) {
          case 0:
            context.go('/');
          case 1:
            context.go('/favourites');
        }
      },
    );

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: menuIndex,
        onDestinationSelected: (int index) {
          ref.read(pageIndexProvider.notifier).update((state) => index);
        },
        destinations: <NavigationDestination>[
          NavigationDestination(
            selectedIcon: const Icon(MfgLabs.home),
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
}
