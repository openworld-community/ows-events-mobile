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
            break;
          case 1:
            context.go('/favourites');
            break;
          case 2:
            context.go('/profile');
            break;
        }
      },
    );

    final Color selectedColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(MfgLabs.home),
            label: 'billboardTab'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'favoritesTab'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            label: 'profileTab'.tr(),
          ),
        ],
        currentIndex: menuIndex,
        selectedItemColor: selectedColor,
        onTap: (int index) {
          ref.read(pageIndexProvider.notifier).update((state) => index);
        },
      ),
    );
  }
}
