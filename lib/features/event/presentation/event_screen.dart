import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/features/event/presentation/favorite_button.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';

class EventScreen extends ConsumerWidget {
  const EventScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // TODO: добавить свой собственный контроллер
    final AsyncValue<List<EventWithFavoriteMark>> asyncEventsListData =
        ref.watch(eventsListControllerProvider);
    final EventsListController controller =
        ref.read(eventsListControllerProvider.notifier);

    return asyncEventsListData.when(
      data: (events) {
        final eventWithFavoriteMark =
            events.firstWhere((element) => element.event.id == id);
        final eventData = eventWithFavoriteMark.event;
        toggleEventToFavorites() =>
            controller.toggleEventToFavorites(eventData.id);
        return MaxWidthContainer(
          child: Scaffold(
            appBar: AppBar(
              title: Text(eventData.title),
              actions: [
                IconButton(
                  onPressed: () {
                    Share.share("shareEventLinkMessageText".tr(
                      namedArgs: {
                        "title": eventData.title,
                        "location": eventData.location.city,
                        "URL":
                            "https://afisha.peredelano.com/event/${eventData.id}",
                      },
                    ));
                  },
                  icon: const Icon(Icons.ios_share),
                  color: Colors.black,
                )
              ],
            ),
            body: Column(
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
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            eventData.price.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  eventData.date.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${eventData.location.country}, ${eventData.location.city}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppTheme.blue1,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  eventData.description,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppTheme.blue1,
                      ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: FavoriteButton(
                    onPressed: toggleEventToFavorites,
                    favorite: eventWithFavoriteMark.favoriteMark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      // TODO: в дальнейшем заменить на виджет для вывода ошибки
      error: (error, _) => Text(error.toString()),
      loading: () => const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
