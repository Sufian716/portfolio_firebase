import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/skills/skill_box.dart';
import 'package:portfolio/widgets/skills/skills_category_title.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    bool isTablet = MediaQuery.of(context).size.width < 1100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SectionTitle(sectionTitle: "Fähigkeiten"),
        const SizedBox(height: 10),
                      //Text(
                      //  "IT-Assistent/Fachinformatiker 2017-2019 Werner von Siemens Schule",
                     //   style: GoogleFonts.roboto(
                     //       fontSize: 40,
                     //       color: Colors.grey.shade800,
                     //       letterSpacing: 1.5),
                     //   textAlign: isMobile ? TextAlign.center : null,
                     // ),
        
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: isMobile || isTablet
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            isMobile || isTablet
                ? const SizedBox()
                : LottieBuilder.asset(
                    "assets/skills_animation.json",
                    width: 500,
                  ),
            const Column(
              children: [
                SkillCategoryTitle(title: "Sprachen"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkillBox(
                          skillLogo: "assets/skills/dart.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/java.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/kotlin.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/python.svg",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkillBox(
                          skillLogo: "assets/skills/c.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/javascript.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/html.svg",
                        ),
                        SkillBox(
                          skillLogo: "assets/skills/css.svg",
                        ),
                      ],
                    ),
                  ],
                ),
                SkillCategoryTitle(title: "Frameworks"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillBox(
                      skillLogo: "assets/skills/flutter.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/curseforge.svg",
                    ),
                  ],
                ),
                SkillCategoryTitle(title: "Datenbanken"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillBox(
                      skillLogo: "assets/skills/mongodb.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/mysql.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/redis.svg",
                    ),
                  ],
                ),
                SkillCategoryTitle(title: "Betriebssysteme"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillBox(
                      skillLogo: "assets/skills/windows.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/linux.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/raspberry_pi.svg",
                    ),
                  ],
                ),
                SkillCategoryTitle(title: "IDEs"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillBox(
                      skillLogo: "assets/skills/vscode.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/eclipse.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/intellij.svg",
                    ),
                    SkillBox(
                      skillLogo: "assets/skills/qt_creator.svg",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
