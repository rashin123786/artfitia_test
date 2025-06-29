class AmountFormatter {
  static String formatAmountToStripe(String amountString) {
    final cleaned = amountString.replaceAll(RegExp(r'[₹,]'), '');
    final amount = int.tryParse(cleaned);
    if (amount == null) throw FormatException('Invalid amount format');
    return (amount * 100).toString();
  }
}
