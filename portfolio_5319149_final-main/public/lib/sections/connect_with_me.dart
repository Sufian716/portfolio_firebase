import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/utils/functions/copy_to_clipboard.dart';
import 'package:portfolio/utils/functions/download_resume.dart';
import 'package:portfolio/utils/functions/launch_url.dart';
import 'package:portfolio/widgets/section_title.dart';

class ConnectWithMeSection extends StatelessWidget {
  const ConnectWithMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SectionTitle(sectionTitle: "Kontakt aufnehmen"),
        const SizedBox(height: 50),
        Column(
          children: [
            isMobile
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("info@cyber-trouble.de",
                                    style: GoogleFonts.inter()),
                                IconButton(
                                  onPressed: () {
                                    copyToClipboard(
                                        context,
                                        "info@cyber-trouble.de",
                                        'Email copied to clipboard!');
                                  },
                                  icon: const Icon(Icons.copy),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("www.cyber-trouble.de",
                                    style: GoogleFonts.inter()),
                                IconButton(
                                  onPressed: () {
                                    launchLink(
                                        profileLink:
                                            "https://cyber-trouble.de/");
                                  },
                                  icon: const Icon(Icons.link),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("info@cyber-trouble.de",
                                style: GoogleFonts.inter()),
                            IconButton(
                              onPressed: () {
                                copyToClipboard(
                                    context,
                                    "info@cyber-trouble.de",
                                    'Email copied to clipboard!');
                              },
                              icon: const Icon(Icons.copy),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("www.cyber-trouble.de",
                                  style: GoogleFonts.inter()),
                              IconButton(
                                onPressed: () {
                                  launchLink(
                                      profileLink: "https://cyber-trouble.de/");
                                },
                                icon: const Icon(Icons.link),
                              ),
                            ],
                          ))
                    ],
                  ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: downloadResume,
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ConstColors.primaryColor, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Lebenslauf",
                      style: GoogleFonts.montserrat(fontSize: 18),
                    ),
                    const IconButton(
                      onPressed: downloadResume,
                      icon: FaIcon(
                        FontAwesomeIcons.fileArrowDown,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
