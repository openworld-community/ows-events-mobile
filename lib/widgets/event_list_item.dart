
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/resources/colors.dart';
import 'package:ows_events_mobile/resources/text_styles.dart';

class EvenListItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String price;
  final String linkText;
  final String image;
  final VoidCallback linkAction;
  final VoidCallback itemAction;

  const EvenListItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.price,
    required this.linkText,
    required this.image,
    required this.linkAction,
    required this.itemAction
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
                Image.network(
                    image,
                    fit: BoxFit.fitWidth),
                Positioned(
                    top: 12,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                      decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text(
                        price,
                        style: AppTextStyles.priceTextStyle,
                      ),
                    )
                )
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
                  child:   Text(
                    description,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.secondaryText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.mainTextStyleWeight,
                  ),
                ),

                Text(
                  date,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.secondaryText,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 44),
                    child: GestureDetector(
                        onTap: linkAction,
                        child: Text(
                          linkText,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.linkTextStyle,
                        )
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}