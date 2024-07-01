import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillCategoryTitle extends StatelessWidget {
  const SkillCategoryTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
            fontSize: isMobile ? 16 : 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
