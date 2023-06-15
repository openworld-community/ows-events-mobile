import 'package:flutter/material.dart';
import 'package:ows_events_mobile/resources/colors.dart';
import 'package:ows_events_mobile/resources/text_styles.dart';

class EventListItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String price;
  final String venueLinkText;
  final String image;
  final VoidCallback venueLinkAction;
  final VoidCallback itemAction;

  const EventListItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.price,
    required this.venueLinkText,
    required this.image,
    required this.venueLinkAction,
    required this.itemAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: itemAction,
      child: Column(
        children: [
          SizedBox(
            height: 176,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(image, fit: BoxFit.fitWidth),
                Positioned(
                  top: 12,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      price,
                      style: AppTextStyles.priceTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    description,
                    style: AppTextStyles.secondaryText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    title,
                    style: AppTextStyles.mainTextStyle,
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.secondaryText,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 44),
                  child: GestureDetector(
                    onTap: venueLinkAction,
                    child: Text(
                      venueLinkText,
                      style: AppTextStyles.linkTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
