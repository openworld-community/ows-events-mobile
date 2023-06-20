import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle secondaryText = TextStyle(
      fontSize: 12,
      height: 16/12,
      fontWeight: FontWeight.w500,
      color: AppColors.secondTextColor
  );
  static const TextStyle mainTextStyleWeight = TextStyle(
      fontSize: 18,
      height: 24/18,
      fontWeight: FontWeight.w500,
      color: AppColors.mainTextColor
  );
  static const TextStyle mainTextStyle = TextStyle(
      fontSize: 18,
      height: 27/18,
      fontWeight: FontWeight.w400,
      color: AppColors.mainTextColor
  );
  static const TextStyle linkTextStyle = TextStyle(
      fontSize: 12,
      height: 14.52/12,
      fontWeight: FontWeight.w400,
      color: AppColors.linkTextColor,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.linkTextColor
  );
  static const TextStyle priceTextStyle = TextStyle(
      fontSize: 12,
      height: 16/12,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 16,
    height: 24/16,
    fontWeight: FontWeight.w400,
    color: AppColors.mainTextColor
  );
  static const TextStyle inputTextStyleWhite = TextStyle(
    fontSize: 16,
    height: 24/16,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );
}