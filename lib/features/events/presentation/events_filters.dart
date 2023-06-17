import 'package:flutter/material.dart';

class EventsFilters extends StatelessWidget {
  const EventsFilters({
    super.key,
    required this.onSearchTextChanged,
    required this.onCountryTextChanged,
    required this.onCityTextChanged,
  });

  final void Function(String) onSearchTextChanged;
  final void Function(String) onCountryTextChanged;
  final void Function(String) onCityTextChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
                hintText: 'Поиск',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: onCountryTextChanged,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
                      hintText: 'Страна',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    onChanged: onCityTextChanged,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
                      hintText: 'Город',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
