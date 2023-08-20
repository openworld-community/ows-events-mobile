import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        // TODO: добавить обработчик при закрытии
        throw UnimplementedError(
            'не реализован функционал на закрытие фильтров');
      },
      builder: (context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("filtersTitle".tr()),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('apply'.tr()),
            )
          ],
        ),
        body: const Placeholder(),
      ),
    );
  }
}
