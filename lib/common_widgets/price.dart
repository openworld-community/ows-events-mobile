import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({super.key, required this.price});

  final String? price;

  @override
  Widget build(BuildContext context) {
    final String priceText = _getPriceText(price);

    return Container(
      padding: const EdgeInsets.fromLTRB(7, 5, 7, 7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        priceText,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
      ),
    );
  }

  String _getPriceText(String? price) {
    if (price == null || price == '') return 'priceNull'.tr();

    if (price == '0') return 'priceFree'.tr();

    return price;
  }
}
