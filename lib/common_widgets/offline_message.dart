import 'package:flutter/material.dart';

class OfflineMessage extends StatelessWidget {
  const OfflineMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
