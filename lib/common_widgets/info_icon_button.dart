import 'package:flutter/material.dart';

class InfoIconButton extends StatelessWidget {
  const InfoIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        throw UnimplementedError();
      },
      icon: const Icon(
        Icons.info_outline_rounded,
        size: 35,
      ),
    );
  }
}
