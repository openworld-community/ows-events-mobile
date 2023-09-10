import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: поменять на данные, получаеммые по валютам с бэка
final currenciesProvider = Provider<Map<String, String>>((ref) => {
      'rub': 'rub',
      'dollar': '\$',
    });
