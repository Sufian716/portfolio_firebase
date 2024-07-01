import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavOption extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NavOption({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.ubuntu(letterSpacing: 1.5),
        ),
      ),
    );
  }
}
