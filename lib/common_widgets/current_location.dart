import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ows_events_mobile/core/current_location_provider.dart';

class CurrentLocation extends ConsumerStatefulWidget {
  const CurrentLocation({super.key});

  @override
  ConsumerState<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends ConsumerState<CurrentLocation> {
  String? _location;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final String location = await ref.read(currentLocationProvider.future);

      setState(() {
        _location = location;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ваш город:',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.grey[500],
              ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              FontAwesome5.location_arrow,
              color: Theme.of(context).colorScheme.primary,
              size: 17,
            ),
            const SizedBox(width: 10),
            if (_location != null)
              Text(
                _location!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        )
      ],
    );
  }
}
