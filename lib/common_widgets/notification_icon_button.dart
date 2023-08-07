import 'package:flutter/material.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // TODO: реализовать функционал кнопки нотификации
        throw UnimplementedError();
      },
      icon: const Icon(
        Icons.notifications_none_rounded,
        size: 25,
      ),
    );
  }
}
