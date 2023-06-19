import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndex extends StateNotifier<int> {
  PageIndex() : super(0);

  set value(int index) => state = index;
}

final indexProvider = StateNotifierProvider((ref) => PageIndex());
