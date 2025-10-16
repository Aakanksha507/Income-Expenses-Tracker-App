class FormValidation {
  static String? validCardName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card Name is required';
    }
    if (value.trim().length < 4) {
      return 'Card Name must be at least 4 Characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return '';
    }
    return null;
  }

  static String? validCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card number is required';
    }

    String trimmedValue = value.replaceAll(' ', '');

    if (trimmedValue.length < 16) {
      return 'Card number must be at least 16 digits';
    }

    if (!RegExp(r'^\d{16,19}$').hasMatch(trimmedValue)) {
      return 'Card number must contain only digits';
    }

    return null;
  }

  static String? validCategoryExpenses(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Category is required';
    }
    return null;
  }

  static String? validAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }
    return null;
  }

  static String? validCardCVC(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Zip is required';
    }
    return null;
  }

  static String? validCardZip(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Zip is required';
    }
    return null;
  }

  static String? validDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date is required';
    }
    return null;
  }
}
