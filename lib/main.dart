import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/features/events/data/api/events_api.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/routing.dart';
import 'package:ows_events_mobile/util/time_utils.dart';
import 'package:ows_events_mobile/widgets/event_list_item.dart';

import 'features/events/domain/event.dart';

final logger = Logger();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => const MyHomePage(
              title: '???',
            ),
        '/event': (context) => const EventScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> events = [];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

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
                      const Text("30 дней"),
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
                  const eventTitle = 'Peredelanoconf';
                  return EvenListItem(
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
                        Navigator.of(context)
                            .pushNamed('/event', arguments: eventTitle);
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

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String? eventTitle;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print('You must provide args!');
      return;
    }
    if (args is String) {
      print('You must provide String args!');
      return;
    }
    eventTitle = args as String;

    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(eventTitle ?? '...')),
      body: SliverList.builder(itemCount: 5, 
      itemBuilder: (context, index) {
        
      }),
    );
  }
}
