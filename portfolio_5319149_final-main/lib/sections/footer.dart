import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(
            "assets/wave.svg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Sufian Bourkha Tahiri © 2024",
              style: GoogleFonts.montserrat(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
