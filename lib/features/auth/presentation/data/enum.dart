import 'package:flutter/material.dart';

enum ExpensesCategory { upWork, paypal, youtube, netflix, starbucks, spotify }

extension ExpensesCategoryExtension on ExpensesCategory {
  String label(BuildContext context) {
    switch (this) {
      case ExpensesCategory.upWork:
        return "UpWork";
      case ExpensesCategory.paypal:
        return "PayPal";
      case ExpensesCategory.youtube:
        return "Youtube";
      case ExpensesCategory.netflix:
        return "Netflix";
      case ExpensesCategory.starbucks:
        return "Starbucks";
      case ExpensesCategory.spotify:
        return "Spotify";
    }
  }

  String getAssets(BuildContext context) {
    switch (this) {
      case ExpensesCategory.upWork:
        return "assets/images/upWork.png";
      case ExpensesCategory.paypal:
        return "assets/images/paypal.png";
      case ExpensesCategory.youtube:
        return "assets/images/youtube.png";
      case ExpensesCategory.netflix:
        return "assets/images/netflix.png";
      case ExpensesCategory.starbucks:
        return "assets/images/starbuck.png";
      case ExpensesCategory.spotify:
        return "assets/images/spotify.png";
    }
  }

  bool get isIncome =>
      this == ExpensesCategory.upWork || this == ExpensesCategory.paypal;

  Color get amountColor => isIncome ? Colors.green : Colors.red;
}
