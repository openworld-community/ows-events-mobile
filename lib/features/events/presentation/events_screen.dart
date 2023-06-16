import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/features/events/data/api/events_api.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/main.dart';
import 'package:ows_events_mobile/util/time_utils.dart';
import 'package:ows_events_mobile/features/events/presentation/event_list_item.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final eventsApi = EventsApi(dio);
    final eventsRepo = EventsRepository(eventsApi);
    loadData(eventsRepo);
  }

  Future<void> loadData(eventsRepo) async {
    final loadedEvents = await eventsRepo.getEvents();
    logger.i(loadedEvents);
    setState(() {
      events = loadedEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallSizeScreen = screenSize.width <= 500;

    return Center(
      child: SizedBox(
        width: isSmallSizeScreen ? double.infinity : 500,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                leading: Row(
                  children: [Image.asset('assets/logo.png')],
                ),
                title: const Text('Мероприятия'),
                actions: [
                  Row(
                    children: [
                      const Text("30 дней до конца подписки"),
                      IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.info_outline_rounded, size: 35)),
                    ],
                  )
                ],
              ),
              SliverList.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  Event event = events[index];
                  return EventListItem(
                      title: event.title,
                      description: event.description,
                      date: TimeUtils.formatDateTime(event.date),
                      linkText:
                          '${event.location.country}, ${event.location.city}',
                      image: event.image,
                      price: event.price.toString(),
                      linkAction: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Click on link")));
                        logger.d('Click on link');
                      },
                      itemAction: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Click on item")));
                        logger.d('Click on item');
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
