import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/price.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';
import 'package:ows_events_mobile/util/time_utils.dart';

class HomeEventCard extends StatelessWidget {
  const HomeEventCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    this.priceFix,
    this.currency,
    this.categories,
    this.wide = false,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final DateTime date;
  final String? priceFix;
  final String? currency;
  final List<String>? categories;
  final bool wide;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double width = wide ? 304 : 240;
    const Color textColor = Colors.white;
    final TextStyle labelStyle =
        Theme.of(context).textTheme.labelMedium!.copyWith(
              color: textColor,
            );
    const dot = Text(
      ' • ',
      style: TextStyle(color: textColor),
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(AppTheme.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  TimeUtils.formatDateTime(date, format: 'dd/MM, HH:mm'),
                  style: labelStyle,
                ),
                dot,
                Price(
                  price: priceFix,
                  currency: currency,
                ),
                dot,
                if (categories != null && categories!.isNotEmpty)
                  Wrap(
                    children: categories!
                        .map((category) => Text(
                              category,
                              style: labelStyle,
                            ))
                        .toList(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
