import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class BottomSheetWithScuffold extends StatelessWidget {
  const BottomSheetWithScuffold({
    super.key,
    required this.onClosing,
    required this.child,
    required this.titleText,
    required this.onApplyPressed,
  });

  final String titleText;
  final Widget child;
  final VoidCallback onClosing;
  final VoidCallback onApplyPressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: onClosing,
      builder: (context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(titleText),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('apply'.tr()),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            AppTheme.padding,
            AppTheme.padding * 2,
            AppTheme.padding,
            AppTheme.padding,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );
  }
}
