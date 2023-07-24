import 'package:flutter/material.dart';

class AuthorizationIconButton extends StatelessWidget {
  const AuthorizationIconButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.login),
    );
  }
}
