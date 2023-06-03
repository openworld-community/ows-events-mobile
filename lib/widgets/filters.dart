import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  final TextEditingController _textControllerSearch = TextEditingController();
  final TextEditingController _textControllerCountry = TextEditingController();
  final TextEditingController _textControllerCity = TextEditingController();
  final void Function(String) onSearchTextChanged;
  final void Function(String) onCountryTextChanged;
  final void Function(String) onCityTextChanged;

  FiltersWidget({
    super.key,
    required this.onSearchTextChanged,
    required this.onCountryTextChanged,
    required this.onCityTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _textControllerSearch,
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
          Row(
            children: <Widget>[
              const SizedBox(height: 70),
              Expanded(
                child: TextField(
                  controller: _textControllerCountry,
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
                  controller: _textControllerCity,
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
    );
  }
}
