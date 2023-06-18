import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/presentation/rounded_text_field.dart';

import '../../../resources/colors.dart';
import '../../../resources/text_styles.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  const CreateEventScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventScreenState();

}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  String countryText= '';
  String cityText = '';
  String timezoneText = '';
  String nameText = '';
  String descriptionText = '';
  String startDateText = '';
  String startTimeText = '';
  String endDateText = '';
  String endTimeText = '';
  String priceText = '';
  String linkText = '';

  void _updateCountryText(String value) {
    setState(() {
      countryText = value;
    });
  }
  void _updateCityText(String value) {
    setState(() {
      cityText = value;
    });
  }
  void _updateTimezoneText(String value) {
    setState(() {
      timezoneText = value;
    });
  }
  void _updateNameText(String value) {
    setState(() {
      nameText = value;
    });
  }
  void _updateDescriptionText(String value) {
    setState(() {
      descriptionText = value;
    });
  }
  void _updateStartDate(String value) {
    setState(() {
      startDateText = value;
    });
  }
  void _updateStartTimeText(String value) {
    setState(() {
      startTimeText = value;
    });
  }
  void _updateEndDateText(String value) {
    setState(() {
      endDateText = value;
    });
  }
  void _updateEndTimeText(String value) {
    setState(() {
      endTimeText = value;
    });
  }
  void _updatePriceText(String value) {
    setState(() {
      priceText = value;
    });
  }
  void _updateLinkText(String value) {
    setState(() {
      linkText = value;
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
            appBar:  AppBar(
              centerTitle: true,
              title: const Text('Добавьте мероприятие'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Локация',
                            textAlign: TextAlign.left,
                            style: AppTextStyles.mainTextStyle,
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children: [
                              RoundedTextField(
                                hintText: 'Страна',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: countryText,
                                onTextChanged: _updateCountryText,
                              ),
                              const SizedBox(height: 16),
                              RoundedTextField(
                                hintText: 'Город',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: cityText,
                                onTextChanged: _updateCityText,
                              ),
                              const SizedBox(height: 16),
                              RoundedTextField(
                                hintText: 'Часовой пояс',
                                suffixIcon: Icons.arrow_drop_down_sharp,
                                text: timezoneText,
                                onTextChanged: _updateTimezoneText,
                              )
                            ],
                          )
                        ]
                    ),

                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Общая информация',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.mainTextStyle,
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            RoundedTextField(
                              hintText: 'Название',
                              text: nameText,
                              onTextChanged: _updateNameText,
                            ),
                            const SizedBox(height: 16),
                            RoundedTextField(
                              hintText: 'Описание',
                              maxLines: 3,
                              minLines: 3,
                              text: descriptionText,
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
                        const Text(
                          'Начало',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.mainTextStyle,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedTextField(
                                hintText: 'дд.мм.гг',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.calendar_today_outlined,
                                text: startDateText,
                                onTextChanged: _updateStartDate,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RoundedTextField(
                                hintText: '--:--',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.access_time,
                                text: startTimeText,
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
                        const Text(
                          'Окончание',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.mainTextStyle,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedTextField(
                                hintText: 'дд.мм.гг',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.calendar_today_outlined,
                                text: endDateText,
                                onTextChanged: _updateEndDateText,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RoundedTextField(
                                hintText: '--:--',
                                keyboardType: TextInputType.datetime,
                                suffixIcon: Icons.access_time,
                                text: endTimeText,
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
                        const Text(
                          'Стоимость',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.mainTextStyle,
                        ),
                        const SizedBox(height: 12),
                        RoundedTextField(
                          keyboardType: TextInputType.number,
                          inputFormatters:
                          [FilteringTextInputFormatter.digitsOnly],
                          text: priceText,
                          onTextChanged: _updatePriceText,
                        )
                      ],
                    ),

                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ссылка на регистрацию',
                          textAlign: TextAlign.left,
                          style: AppTextStyles.mainTextStyle,
                        ),
                        const SizedBox(height: 12),
                        RoundedTextField(
                          keyboardType: TextInputType.number,
                          text: linkText,
                          onTextChanged: _updateLinkText,
                        )
                      ],
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.image),
                      label: const Row(
                        children: [
                          Text(
                            'Добваить фото',
                            style: AppTextStyles.inputTextStyle,
                          ),
                          SizedBox(width: 8),
                          // Дополнительные виджеты текста, если необходимо
                        ],
                      ),
                      onPressed: () {  },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side: const BorderSide(
                                color: AppColors.input,
                                width: 1.0
                            ),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.input),
                        maximumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 40)),
                        elevation: MaterialStateProperty.all<double>(0),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 7),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            style:  ButtonStyle(
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  side: const BorderSide(
                                      color: AppColors.input,
                                      width: 1.0
                                  ),
                                ),
                              ),
                              backgroundColor:
                              MaterialStateProperty
                                  .all<Color>(Colors.white),
                              foregroundColor:
                              MaterialStateProperty
                                  .all<Color>(AppColors.mainTextColor),
                              maximumSize:
                              MaterialStateProperty.all<Size>(const Size(200, 40)),
                              elevation: MaterialStateProperty.all<double>(0),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets
                                    .symmetric(vertical: 16, horizontal: 7),
                              ),

                            ),
                            child: const Text(
                              'Отмена',
                              style: AppTextStyles.inputTextStyle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: (){},
                            style:  ButtonStyle(
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  side: const BorderSide(
                                      color: AppColors.input,
                                      width: 1.0
                                  ),
                                ),
                              ),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.accent),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              maximumSize:
                              MaterialStateProperty.all<Size>(const Size(200, 40)),
                              elevation: MaterialStateProperty.all<double>(0),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets
                                    .symmetric(vertical: 16, horizontal: 7),
                              ),
                            ),
                            child: const Text(
                                'Сохранить',
                                style: AppTextStyles.inputTextStyleWhite
                            ),
                          )
                        ]
                    ),
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