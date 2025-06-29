import 'package:artifitia_test/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:artifitia_test/features/home/presentation/widgets/deal_of_day_widget.dart';
import 'package:artifitia_test/features/home/presentation/widgets/horizontal_item_widget.dart';
import 'package:artifitia_test/features/home/presentation/widgets/special_offer_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/shared/widget/common_appbar.dart';
import '../widgets/banner_one_widget.dart';
import '../widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeCategoryEvent());
    context.read<HomeBloc>().add(FetchHomeBannerEvent());
    super.initState();
  }

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "All Fetaured",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Card(
                    color: Colors.white,
                    elevation: 0.3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Sort ',
                            style: GoogleFonts.montserrat(color: Colors.black),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.swap_vert,
                                  size: 16,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0.3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Filter ',
                            style: GoogleFonts.montserrat(color: Colors.black),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.filter_alt_outlined,
                                  size: 16,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            CategoryWidget(),
            BannerOneWidget(carouselSliderController: carouselSliderController),
            DealOfTheDayCard(),
            HorizontalItemWidget(),
            SpecialOfferCard(),
            Image.asset('assets/images/hot_summer_sale.png'),
            HorizontalItemWidget(),
          ],
        ),
      ),
    );
  }
}
