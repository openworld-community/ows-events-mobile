import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_events_mobile/resources/colors.dart';
import 'package:ows_events_mobile/resources/text_styles.dart';
import 'package:ows_events_mobile/widgets/rounded_text_field.dart';

class CreateEventMenu extends StatelessWidget {
  CreateEventMenu({super.key});
  final TextEditingController countryController= TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController timezoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController linkController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      title: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Добавьте мероприятие',
        ),
      ),
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
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
                          controller: countryController,
                        ),
                        const SizedBox(height: 16),
                        RoundedTextField(
                          hintText: 'Город',
                          suffixIcon: Icons.arrow_drop_down_sharp,
                          controller: cityController,
                        ),
                        const SizedBox(height: 16),
                        RoundedTextField(
                          hintText: 'Часовой пояс',
                          suffixIcon: Icons.arrow_drop_down_sharp,
                          controller: timezoneController,
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
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      RoundedTextField(
                        hintText: 'Описание',
                        maxLines: 3,
                        minLines: 3,
                        controller: descriptionController,
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
                          controller: startDateController,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoundedTextField(
                          hintText: '--:--',
                          keyboardType: TextInputType.datetime,
                          suffixIcon: Icons.access_time,
                          controller: startTimeController,
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
                          controller: endDateController,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoundedTextField(
                          hintText: '--:--',
                          keyboardType: TextInputType.datetime,
                          suffixIcon: Icons.access_time,
                          controller: endTimeController,
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
                    controller: priceController,
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
                    controller: linkController,
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
                      side: const BorderSide(color: AppColors.input, width: 1.0),
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
              )
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              style:  ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: const BorderSide(color: AppColors.input, width: 1.0),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor:
                MaterialStateProperty.all<Color>(AppColors.mainTextColor),
                maximumSize:
                MaterialStateProperty.all<Size>(const Size(200, 40)),
                elevation: MaterialStateProperty.all<double>(0),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 7),
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
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: const BorderSide(color: AppColors.input, width: 1.0),
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
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 7),
                ),
              ),
              child: const Text(
                  'Сохранить',
                  style: AppTextStyles.inputTextStyleWhite
              ),
            )
          ],
        )
      ],
    );
  }
}