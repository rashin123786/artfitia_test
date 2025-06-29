import 'package:artifitia_test/features/checkout/presentation/screens/shopping_bag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../features/home/domain/entity/items_entity.dart';

class EachItemDetailScreen extends StatefulWidget {
  const EachItemDetailScreen({super.key, this.data});
  final ItemsEntity? data;
  @override
  State<EachItemDetailScreen> createState() => _EachItemDetailScreenState();
}

class _EachItemDetailScreenState extends State<EachItemDetailScreen> {
  int selectedSizeIndex = 1;
  final List<String> sizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Carousel
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: List.generate(
                    3,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                          imageUrl: widget.data?.imageUrl ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() => current = index);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// Sizes
            const Text('Size: 7UK',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: List.generate(sizes.length, (index) {
                final isSelected = selectedSizeIndex == index;
                return ChoiceChip(
                  selected: isSelected,
                  label: Text(sizes[index]),
                  selectedColor: Colors.red.shade100,
                  onSelected: (_) {
                    setState(() => selectedSizeIndex = index);
                  },
                );
              }),
            ),
            const SizedBox(height: 16),

            /// Product Title
            Text(widget.data?.name ?? "",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Vision Alta Men’s Shoes Size (All Colours)',
                style: GoogleFonts.montserrat(color: Colors.grey)),

            Row(
              children: [
                RatingBarIndicator(
                  rating: 3.5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                const SizedBox(width: 8),
                const Text('56,890', style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 8),

            /// Price
            Row(
              children: [
                Text(widget.data?.amount ?? '',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey)),
                SizedBox(width: 8),
                Text(widget.data?.amount ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text('50% Off', style: TextStyle(color: Colors.red)),
              ],
            ),

            const SizedBox(height: 12),

            Text('Product Details',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            const Text(
              'Perhaps the most iconic sneaker of all-time, this original “Chicago”? colorway is the cornerstone to any sneaker collection...',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            /// Info Tags
            Row(
              children: [
                infoTag(Icons.store, 'Nearest Store'),
                const SizedBox(width: 8),
                infoTag(Icons.workspace_premium, 'VIP'),
                const SizedBox(width: 8),
                infoTag(Icons.assignment_return, 'Return policy'),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingBagScreen(
                            data: widget.data!,
                          ),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topLeft: Radius.circular(60),
                            )),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "    Go to cart",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color:
                                      const Color.fromARGB(239, 33, 149, 243),
                                  border: Border.all(
                                    width: 0.9,
                                    color:
                                        const Color.fromARGB(255, 3, 78, 139),
                                  ),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingBagScreen(
                            data: widget.data!,
                          ),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 118, 187, 120),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topLeft: Radius.circular(60),
                            )),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "    Buy Now",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: const Color.fromARGB(237, 13, 118, 3),
                                  border: Border.all(
                                    width: 0.9,
                                    color: const Color.fromARGB(255, 3, 139, 8),
                                  ),
                                ),
                                child: Icon(
                                  Icons.touch_app_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ))
              ],
            ),

            const SizedBox(height: 16),

            /// Delivery Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Delivery in\n1 within Hour',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            /// Bottom Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    label: const Text('View Similar')),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.compare_arrows,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    label: const Text('Add to Compare')),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget infoTag(IconData icon, String label) {
    return Chip(
      backgroundColor: Colors.white,
      avatar: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
