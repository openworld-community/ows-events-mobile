import 'package:flutter/material.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class EventsListItem extends StatelessWidget {
  const EventsListItem({
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

  final String title;
  final String description;
  final String date;
  final String price;
  final String venueLinkText;
  final String image;
  final VoidCallback venueLinkAction;
  final VoidCallback itemAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: itemAction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 176,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 12,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      4,
                      10,
                      4,
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      price,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              15,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    8,
                    0,
                    8,
                  ),
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    8,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    8,
                    0,
                    44,
                  ),
                  child: GestureDetector(
                    onTap: venueLinkAction,
                    child: Text(
                      venueLinkText,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppTheme.blue1,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
