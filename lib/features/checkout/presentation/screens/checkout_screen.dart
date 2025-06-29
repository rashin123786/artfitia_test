import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/shared/screen/bottom_nav_screen.dart';
import '../../../../core/utils/amount_formatter.dart';
import '../controller/bloc/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _priceRow("Order", amount, bold: false),
            const SizedBox(height: 8),
            _priceRow("Shipping", "₹ 0", bold: false),
            const SizedBox(height: 12),
            _priceRow("Total", amount, bold: true),
            const Divider(height: 32),
            Text("Payment",
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            const PaymentCard(
              isSelected: true,
              image: 'assets/images/stripe.png',
              cardText: '********2109',
              borderColor: Colors.red,
            ),
            const SizedBox(height: 12),
            const PaymentCard(
              isSelected: false,
              image: 'assets/images/checkout_apple.png',
              cardText: '********2109',
            ),
            const Spacer(),
            BlocConsumer<CheckoutBloc, CheckoutState>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/payment_success.png",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              const Icon(
                                Icons.done,
                                size: 40,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Payment done successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).then(
                    (value) {
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => BottomNavScreen()),
                          (route) => false,
                        );
                      }
                    },
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: state is PaymentProcessing
                        ? () {}
                        : () async {
                            final formattedAmount =
                                AmountFormatter.formatAmountToStripe(amount);
                            context.read<CheckoutBloc>().add(
                                MakeStripePaymentEvent(
                                    amount: formattedAmount, currency: "INR"));
                          },
                    child: Text(
                        state is PaymentProcessing
                            ? "   Loading...."
                            : "Continue",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold)),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        Text(value,
            style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String image;
  final String cardText;
  final bool isSelected;
  final Color? borderColor;

  const PaymentCard({
    super.key,
    required this.image,
    required this.cardText,
    this.isSelected = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color:
              isSelected ? (borderColor ?? Colors.red) : Colors.grey.shade300,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(image, height: 24),
          const Spacer(),
          Text(cardText,
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
