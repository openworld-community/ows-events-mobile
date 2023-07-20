import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('authorization'.tr()),
        ),
        body: MaxWidthContainer(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    filled: false,
                    border: const OutlineInputBorder(),
                    hintText: 'login'.tr(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: false,
                    border: const OutlineInputBorder(),
                    hintText: 'password'.tr(),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => {},
                  child: Text('enter'.tr()),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () => {},
                  child: Text('register'.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
