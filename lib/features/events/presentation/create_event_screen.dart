import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/presentation/rounded_text_field.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  const CreateEventScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventScreenState();
}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  String _countryText = '';
  String _cityText = '';
  String _timezoneText = '';
  String _nameText = '';
  String _descriptionText = '';
  String _startDateText = '';
  String _startTimeText = '';
  String _endDateText = '';
  String _endTimeText = '';
  String _priceText = '';
  String _linkText = '';

  void _updateCountryText(String value) {
    setState(() {
      _countryText = value;
    });
  }

  void _updateCityText(String value) {
    setState(() {
      _cityText = value;
    });
  }

  void _updateTimezoneText(String value) {
    setState(() {
      _timezoneText = value;
    });
  }

  void _updateNameText(String value) {
    setState(() {
      _nameText = value;
    });
  }

  void _updateDescriptionText(String value) {
    setState(() {
      _descriptionText = value;
    });
  }

  void _updateStartDate(String value) {
    setState(() {
      _startDateText = value;
    });
  }

  void _updateStartTimeText(String value) {
    setState(() {
      _startTimeText = value;
    });
  }

  void _updateEndDateText(String value) {
    setState(() {
      _endDateText = value;
    });
  }

  void _updateEndTimeText(String value) {
    setState(() {
      _endTimeText = value;
    });
  }

  void _updatePriceText(String value) {
    setState(() {
      _priceText = value;
    });
  }

  void _updateLinkText(String value) {
    setState(() {
      _linkText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallSizeScreen = screenSize.width <= 500;
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : 500,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Добавьте мероприятие'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Локация',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children: [
                              RoundedTextField(
                                hintText: 'Страна',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: _countryText,
                                onTextChanged: _updateCountryText,
                              ),
                              const SizedBox(height: 16),
                              RoundedTextField(
                                hintText: 'Город',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: _cityText,
                                onTextChanged: _updateCityText,
                              ),
                              const SizedBox(height: 16),
                              RoundedTextField(
                                hintText: 'Часовой пояс',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: _timezoneText,
                                onTextChanged: _updateTimezoneText,
                              )
                            ],
                          )
                        ]),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Общая информация',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            RoundedTextField(
                              hintText: 'Название',
                              text: _nameText,
                              onTextChanged: _updateNameText,
                            ),
                            const SizedBox(height: 16),
                            RoundedTextField(
                              hintText: 'Описание',
                              maxLines: 3,
                              minLines: 3,
                              text: _descriptionText,
                              onTextChanged: _updateDescriptionText,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Начало',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedTextField(
                                hintText: 'дд.мм.гг',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.calendar_today_outlined,
                                text: _startDateText,
                                onTextChanged: _updateStartDate,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RoundedTextField(
                                hintText: '--:--',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.access_time,
                                text: _startTimeText,
                                onTextChanged: _updateStartTimeText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Окончание',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedTextField(
                                hintText: 'дд.мм.гг',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.calendar_today_outlined,
                                text: _endDateText,
                                onTextChanged: _updateEndDateText,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RoundedTextField(
                                hintText: '--:--',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.access_time,
                                text: _endTimeText,
                                onTextChanged: _updateEndTimeText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Стоимость',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        RoundedTextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          text: _priceText,
                          onTextChanged: _updatePriceText,
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ссылка на регистрацию',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        RoundedTextField(
                          keyboardType: TextInputType.number,
                          text: _linkText,
                          onTextChanged: _updateLinkText,
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.image),
                      label: Row(
                        children: [
                          Text(
                            'Добваить фото',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 8),
                          // Дополнительные виджеты текста, если необходимо
                        ],
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.background),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).dividerColor,
                        ),
                        maximumSize: MaterialStateProperty.all<Size>(
                            const Size(200, 40)),
                        elevation: MaterialStateProperty.all<double>(0),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.background),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).dividerColor,
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
                          'Отмена',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.background),
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
                          'Сохранить',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
