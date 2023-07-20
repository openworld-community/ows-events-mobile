import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/favorite_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/price.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';
import 'package:ows_events_mobile/util/time_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventsListItem extends ConsumerWidget {
  const EventsListItem({
    super.key,
    required this.eventData,
    required this.favorite,
    required this.locationLinkAction,
    required this.itemAction,
    required this.onAddToFavorite,
  });

  final Event eventData;
  final bool favorite;
  final VoidCallback locationLinkAction;
  final VoidCallback itemAction;
  final VoidCallback onAddToFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: eventData.image.toString(),
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/image_event_placeholder.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 16,
                  child: Price(price: eventData.price?.value.toString()),
                ),
                Positioned(
                  top: 12,
                  right: 16,
                  child: FavoriteIconButton(
                    selected: favorite,
                    onPressed: onAddToFavorite,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    eventData.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    eventData.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  TimeUtils.formatDateTime(eventData.date),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 44),
                  child: GestureDetector(
                    onTap: locationLinkAction,
                    child: Text(
                      '${eventData.location.country}, ${eventData.location.city}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppTheme.blue1,
                          ),
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
