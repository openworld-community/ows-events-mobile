import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';

import 'package:ows_events_mobile/theme/app_theme.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({
    super.key,
    required this.eventData,
  });

  final Event eventData;

  @override
  Widget build(BuildContext context) {
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
                  Image.network(
                    eventData.image,
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
            Text(eventData.description,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.blue1,
                    )),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    minimumSize: const Size(
                      400,
                      50,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    // TODO: добавить реализацию действия Зарегестрироваться
                    throw UnimplementedError();
                  },
                  child: const Text('Зарегистрироваться'),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                          160,
                          50,
                        ),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        // TODO: добавить реализацию действия Редактировать событие
                        throw UnimplementedError();
                      },
                      child: const Text('Редактировать'),
                    ),
                    const SizedBox(width: 40),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                          160,
                          50,
                        ),
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        // TODO: добавить реализацию действия Удалить событие
                        throw UnimplementedError();
                      },
                      child: const Text('Удалить'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
