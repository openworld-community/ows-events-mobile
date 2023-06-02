import 'package:flutter/material.dart';

class TextFields_widget extends StatelessWidget {
  final TextEditingController _textControllerSearch = TextEditingController();
  final TextEditingController _textControllerCountry = TextEditingController();
  final TextEditingController _textControllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _textControllerSearch,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, size: 30.0, color: Colors.grey,),
              contentPadding: EdgeInsets.fromLTRB(15, 12, 12, 12),
              hintText: 'Поиск',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),

          Row(
            children: <Widget>[
              SizedBox(height: 70),
              Expanded(
                child: TextField(
                  controller: _textControllerCountry,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.keyboard_arrow_down, size: 30.0, color: Colors.grey,),
                    contentPadding: EdgeInsets.fromLTRB(15, 12, 12, 12),
                    hintText: 'Страна',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  controller: _textControllerCity,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.keyboard_arrow_down, size: 30.0, color: Colors.grey,),
                    contentPadding: EdgeInsets.fromLTRB(15, 12, 12, 12),
                    hintText: 'Город',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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