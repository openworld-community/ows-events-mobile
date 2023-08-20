import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CountryCityBottomSheet extends StatelessWidget {
  const CountryCityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        // TODO: добавить обработчик при закрытии
        throw UnimplementedError(
            'не реализован функционал на закрытие выбора страны и города');
      },
      builder: (context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("countryCityTitle".tr()),
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
