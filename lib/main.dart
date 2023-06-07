import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/features/events/data/api/events_api.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/routing.dart';
import 'package:ows_events_mobile/util/time_utils.dart';
import 'package:ows_events_mobile/widgets/event_list_item.dart';
import 'package:ows_events_mobile/widgets/filters.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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


    return Scaffold(
      body: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : 500,
          child: CustomScrollView(
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
              MultiSliver(children: [
                FiltersWidget(
                  onSearchTextChanged: (_) {},
                  onCountryTextChanged: (_) {},
                  onCityTextChanged: (_) {},
                ),
                SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return EventListItem(
                        title:
                            'Конференция «Как не умереть от эмигрантской тоски»',
                        description: 'Peredelano',
                        date: '21 мая, 20:00',
                        linkText: 'Вилла отцов разработки',
                        image: 'https://picsum.photos/357/268',
                        price: '500\$',
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
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
