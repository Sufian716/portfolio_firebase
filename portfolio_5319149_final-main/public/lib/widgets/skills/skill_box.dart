import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({
    super.key,
    required this.skillLogo,
  });

  final String skillLogo;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: SvgPicture.asset(
        skillLogo,
        height: isMobile ? 30 : 50,
      ),
    );
  }
}
