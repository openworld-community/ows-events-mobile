import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({super.key, required this.price, required this.currency});

  final String? price;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    final String priceText = _getPriceText(price);

    return Text(
      priceText,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.white,
          ),
    );
  }

  String _getPriceText(String? price) {
    if (price == null || price == '') return 'priceNull'.tr();

    if (price == '0') return 'priceFree'.tr();

    return '$price $currency';
  }
}
