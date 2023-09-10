import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/currency_selector.dart';
import 'package:ows_events_mobile/common_widgets/price_field.dart';
import 'package:ows_events_mobile/features/filters/data/currencies_provider.dart';
import 'package:ows_events_mobile/features/filters/domain/price_currency.dart';

class PriceCurrencyFilter extends ConsumerStatefulWidget {
  const PriceCurrencyFilter({
    super.key,
    required this.onChanged,
  });

  final void Function(PriceCurrency) onChanged;

  @override
  ConsumerState<PriceCurrencyFilter> createState() =>
      _PriceCurrencyFilterState();
}

class _PriceCurrencyFilterState extends ConsumerState<PriceCurrencyFilter> {
  double? _price;
  String? _currency;

  Map<String, String> get _currencies => ref.watch(currenciesProvider);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceField(
          onChanged: (String value) {
            setState(() {
              _price = double.parse(value);
            });

            _setValue();
          },
        ),
        CurrencySelector(
            items: _currencies,
            onChanged: (String? value) {
              setState(() {
                _currency = value;
              });

              _setValue();
            }),
      ],
    );
  }

  void _setValue() {
    if (_price == null || _currency == null) return;

    final priceCurrency = PriceCurrency(price: _price!, currency: _currency!);

    widget.onChanged(priceCurrency);
  }
}
