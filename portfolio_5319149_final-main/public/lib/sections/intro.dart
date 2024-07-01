import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/utils/functions/download_resume.dart';

class IntroSection extends StatelessWidget {
  const IntroSection(
      {super.key, this.onConnectPressed, required this.flipCardKey});

  final Function()? onConnectPressed;
  final GlobalKey flipCardKey;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    bool isTablet = MediaQuery.of(context).size.width < 1100;
    return Container(
      padding: EdgeInsets.only(
          top: 20,
          left: isMobile ? 10 : 80,
          right: isMobile ? 10 : 80,
          bottom: 20),
      child: Stack(
        children: [
           SizedBox(),
               Opacity(
                  opacity: 0.3,
                  child: LottieBuilder.asset(
                    "assets/dots_animation.json",
                    width: isMobile ? 350 : 450,
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(
                top: 50, left: isTablet ? 25 : 150, right: isTablet ? 25 : 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isMobile || isTablet
                          ? Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ConstColors.primaryColor,
                                      Colors.white
                                    ]),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/profile_img_1.png",
                                  width: isMobile ? 150 : 200,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 15),
                      Align(
                        alignment:
                            isMobile ? Alignment.center : Alignment.topLeft,
                        child: Text(
                          "Hey, I'm Sufian Bourkha Tahiri",
                          style: GoogleFonts.ubuntuMono(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile || isTablet ? 25 : 42),
                          textAlign: isMobile ? TextAlign.center : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment:
                            isMobile ? Alignment.center : Alignment.topLeft,
                        child: DefaultTextStyle(
                          style: GoogleFonts.ubuntuMono(
                            fontSize: isMobile || isTablet ? 22 : 32,
                            fontWeight: FontWeight.bold,
                            color: ConstColors.primaryColor,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: const Duration(milliseconds: 2000),
                            animatedTexts: [
                              TypewriterAnimatedText('A Student'),
                              TypewriterAnimatedText('A Developer'),
                              TypewriterAnimatedText('A Boxer'),
                              TypewriterAnimatedText('A Freelancer'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Ich bin ein Student mit Sitz in Deutschland und lebe meine Leidenschaft für Programmierung und Design voll aus. Als Freelancer habe ich die Freiheit, an verschiedenen Projekten zu arbeiten und meine Fähigkeiten kontinuierlich zu verbessern. Meine Motivation, durch Code innovative Ideen zum Leben zu erwecken, treibt mich an, ständig Neues zu lernen und mich weiterzuentwickeln. Ich liebe es, kreative Lösungen zu finden und meinen Beitrag zur Entwicklung einzigartiger Produkte und Dienstleistungen zu leisten.",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            letterSpacing: 1.5),
                        textAlign: isMobile ? TextAlign.center : null,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          MaterialButton(
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            onPressed: downloadResume,
                            color: ConstColors.primaryColor,
                            child: Text(
                              "Lebenslauf",
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                          SizedBox(width: isMobile ? 10 : 20),
                          MaterialButton(
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            onPressed: onConnectPressed,
                            color: ConstColors.secondaryColor,
                            child: Text(
                              "Kontakt",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isMobile || isTablet
                    ? const SizedBox()
                    : FlipCard(
                        key: flipCardKey,
                        direction: FlipDirection.HORIZONTAL,
                        front: Container(
                          height: 400,
                          padding: const EdgeInsets.only(top: 20),
                          margin: isTablet
                              ? const EdgeInsets.all(15)
                              : const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ConstColors.primaryColor,
                                  Colors.white
                                ]),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                              topLeft: Radius.circular(
                                50,
                              ),
                              topRight: Radius.circular(
                                25,
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/profile_img_1.png",
                              width: 300,
                            ),
                          ),
                        ),
                        back: Container(
                          height: 400,
                          padding: const EdgeInsets.only(top: 20),
                          margin: isTablet
                              ? const EdgeInsets.all(15)
                              : const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ConstColors.primaryColor,
                                  Colors.white
                                ]),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(
                                50,
                              ),
                              topLeft: Radius.circular(
                                25,
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Transform.flip(
                              flipX: true,
                              child: Image.asset(
                                "assets/profile_img_1.png",
                                width: 300,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
