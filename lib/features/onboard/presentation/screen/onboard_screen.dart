import 'package:artifitia_test/core/theme/app_theme.dart';
import 'package:artifitia_test/features/onboard/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../auth/presentation/screen/login_screen.dart';
import '../widgets/onboard_image_widget.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => RichText(
                    text: TextSpan(
                        text: '${controller.currentPage.value + 1}',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '/3',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey,
                            ),
                          )
                        ]),
                  ),
                ),
                Text(
                  'Skip',
                  style: GoogleFonts.montserrat(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: 3,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (_, index) => OnboardImageWidget(assetindex: index),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: controller.prevPage,
                    child: Text(
                      "Prev",
                      style: GoogleFonts.montserrat(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )),
                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                    dotHeight: 9,
                  ),
                ),
                Obx(() => TextButton(
                      onPressed: () {
                        if (controller.currentPage.value != 2) {
                          controller.nextPage();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        }
                      },
                      child: Text(
                        controller.currentPage.value == 2
                            ? "Get Started"
                            : "Next",
                        style: GoogleFonts.montserrat(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
