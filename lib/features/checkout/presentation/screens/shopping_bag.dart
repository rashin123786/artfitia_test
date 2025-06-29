import 'package:artifitia_test/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:artifitia_test/features/home/domain/entity/items_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({super.key, required this.data});
  final ItemsEntity data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Bag"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: const [Icon(Icons.favorite_border)],
      ),
      body: Column(
        children: [
          ProductCard(
            data: data,
          ),
          const Divider(),
          const ApplyCouponTile(),
          const Divider(),
          OrderPaymentDetails(amount: data.amount),
          const Divider(),
          OrderTotalSection(
            amount: data.amount,
          ),
          const Spacer(),
          BottomCheckoutBar(
            amount: data.amount,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data});
  final ItemsEntity data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: data.imageUrl,
              height: 100,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                Text("Checked Single-Breasted Blazer",
                    style: GoogleFonts.montserrat(fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _DropdownText(label: "Size 42"),
                    const SizedBox(width: 12),
                    _DropdownText(label: "Qty 1"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text("Delivery by ",
                        style: GoogleFonts.montserrat(fontSize: 12)),
                    Text("10 May 2XXX",
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DropdownText extends StatelessWidget {
  final String label;
  const _DropdownText({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: Text(label, style: GoogleFonts.montserrat(fontSize: 12)),
    );
  }
}

class ApplyCouponTile extends StatelessWidget {
  const ApplyCouponTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.discount_outlined, size: 30),
      title: Text("Apply Coupons",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500)),
      trailing: Text("Select",
          style: GoogleFonts.montserrat(
              color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}

class OrderPaymentDetails extends StatelessWidget {
  const OrderPaymentDetails({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _PriceRow(title: "Order Amounts", value: amount),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Convenience",
                      style: GoogleFonts.montserrat(fontSize: 13)),
                  const SizedBox(width: 6),
                  Text("Know More",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text("Apply Coupon",
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          _PriceRow(
              title: "Delivery Fee",
              value: "Free",
              valueColor: Colors.red,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}

class OrderTotalSection extends StatelessWidget {
  const OrderTotalSection({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          _PriceRow(
              title: "Order Total", value: amount, fontWeight: FontWeight.bold),
          const SizedBox(height: 6),
          Row(
            children: [
              Text("EMI Available",
                  style: GoogleFonts.montserrat(fontSize: 12)),
              const SizedBox(width: 8),
              Text("Details",
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String value;
  final FontWeight fontWeight;
  final Color valueColor;

  const _PriceRow({
    required this.title,
    required this.value,
    this.fontWeight = FontWeight.w500,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: fontWeight,
            )),
        Text(value,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: valueColor,
              fontWeight: fontWeight,
            )),
      ],
    );
  }
}

class BottomCheckoutBar extends StatelessWidget {
  const BottomCheckoutBar({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount,
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              Text("View Details",
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.red)),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(
                      amount: amount,
                    ),
                  ));
            },
            child: Text("Proceed to Payment",
                style: GoogleFonts.montserrat(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
