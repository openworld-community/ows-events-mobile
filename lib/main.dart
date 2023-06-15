import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/routing.dart';
import 'package:ows_events_mobile/util/scuffold_messages.dart';
import 'package:ows_events_mobile/widgets/event_list_item.dart';
import 'package:ows_events_mobile/widgets/filters.dart';
import 'package:ows_events_mobile/widgets/info_icon_button.dart';
import 'package:ows_events_mobile/widgets/logo.dart';
import 'package:sliver_tools/sliver_tools.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afisha Peredelano',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 500;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallSizeScreen = screenSize.width <= maxWidth;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : maxWidth,
          child: Scaffold(
            appBar: AppBar(
              leading: const Logo(),
              title: const Text('Мероприятия'),
              actions: const [
                Text("30 дней"),
                InfoIconButton(),
              ],
              centerTitle: true,
              leadingWidth: 150,
            ),
            body: CustomScrollView(
              slivers: [
                MultiSliver(children: [
                  FiltersWidget(
                    onSearchTextChanged: (String value) {
                      throw UnimplementedError();
                    },
                    onCountryTextChanged: (String value) {
                      throw UnimplementedError();
                    },
                    onCityTextChanged: (String value) {
                      throw UnimplementedError();
                    },
                  ),
                  SliverList.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return EventListItem(
                          title:
                              'Конференция «Как не умереть от эмигрантской тоски»',
                          description: 'Peredelano',
                          date: '21 мая, 20:00',
                          venueLinkText: 'Вилла отцов разработки',
                          image: 'https://picsum.photos/357/268',
                          price: '500\$',
                          venueLinkAction: () {
                            ScaffoldMessages.showInfoMessage(
                              context,
                              "Click on link",
                            );
                            logger.d('Click on link');
                          },
                          itemAction: () {
                            ScaffoldMessages.showInfoMessage(
                              context,
                              "Click on link",
                            );
                            logger.d('Click on item');
                          });
                    },
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
