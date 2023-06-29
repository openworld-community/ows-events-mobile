import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
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
        return MaxWidthContainer(
          child: Scaffold(
            appBar: AppBar(
              title: Text(eventData.title),
              actions: [
                IconButton(
                  onPressed: () {
                    // TODO: добавить реализацию "Поделиться событием"
                    throw UnimplementedError();
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
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
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
                  child: eventWithFavoriteMark.favoriteMark
                      ? TextButton(
                          onPressed: () =>
                              controller.toggleEventToFavorites(eventData.id),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).dividerColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            maximumSize: MaterialStateProperty.all<Size>(
                              const Size(200, 40),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 7,
                              ),
                            ),
                          ),
                          child: Text(
                            'Удалить из избранного',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      : TextButton(
                          onPressed: () =>
                              controller.toggleEventToFavorites(eventData.id),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primaryContainer),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            maximumSize: MaterialStateProperty.all<Size>(
                              const Size(200, 40),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 7,
                              ),
                            ),
                          ),
                          child: Text(
                            'Добавить в избранное',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
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
