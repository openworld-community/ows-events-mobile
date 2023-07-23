import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().good('Talker started...');

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      runApp(
        EasyLocalization(
          supportedLocales: const [Locale('ru')],
          path: 'assets/translations',
          fallbackLocale: const Locale('ru'),
          child: const ProviderScope(
            child: App(),
          ),
        ),
      );
    },
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
