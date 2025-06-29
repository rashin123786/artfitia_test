import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardImageWidget extends StatelessWidget {
  const OnboardImageWidget({super.key, required this.assetindex});
  final int assetindex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/onboard_img${assetindex + 1}.svg',
          alignment: Alignment.center,
          // width: 200,
          // height: 200,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            assetindex == 0
                ? "Choose Products"
                : assetindex == 1
                    ? "Make Payment"
                    : "Get Your Order",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
