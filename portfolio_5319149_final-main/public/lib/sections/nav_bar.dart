import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/providers/nav_bar_provider.dart';
import 'package:portfolio/widgets/nav_bar/nav_options_mobile.dart';
import 'package:provider/provider.dart';

class NavBarSection extends StatelessWidget {
  const NavBarSection({
    super.key,
    this.onConnectPressed,
    this.onAboutMePressed,
    this.onSkillsPressed,
    this.onProjectsPressed,
  });

  final Function()? onAboutMePressed;
  final Function()? onSkillsPressed;
  final Function()? onProjectsPressed;
  final Function()? onConnectPressed;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    bool isTablet = MediaQuery.of(context).size.width < 1100;
    return Container(
      padding: isMobile
          ? const EdgeInsets.only(left: 20, right: 20)
          : const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/s_logo.png",
                height: isMobile || isTablet ? 70 : 90,
              ),
              Text(
                "Bourkha Tahiri",
                style: GoogleFonts.kodeMono(
                    fontSize: isMobile || isTablet ? 20 : 30),
              ),
            ],
          ),
          isMobile || isTablet
              ? IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  NavOption(
                                      text: "Über mich",
                                      onPressed: () {
                                        onAboutMePressed!();
                                        Navigator.pop(context);
                                      }),
                                  NavOption(
                                    text: "Fähigkeiten",
                                    onPressed: () {
                                      onSkillsPressed!();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  NavOption(
                                    text: "Projekte",
                                    onPressed: () {
                                      onProjectsPressed!();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  NavOption(
                                    text: "Kontakt",
                                    onPressed: () {
                                      onConnectPressed!();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: ConstColors.secondaryColor,
                  ),
                )
              : Consumer<NavBarProvider>(builder: (context, navBarProvider, _) {
                  return Row(
                    children: [
                      MouseRegion(
                        onEnter: (event) {
                          navBarProvider.changeHoveredState(true, "about me");
                        },
                        onExit: (event) {
                          navBarProvider.changeHoveredState(false, "about me");
                        },
                        child: GestureDetector(
                          onTap: onAboutMePressed,
                          child: Text(
                            "Über mich",
                            style: GoogleFonts.ubuntu(
                                fontSize:
                                    navBarProvider.isHoveredOnAboutMe ? 22 : 20,
                                fontWeight: navBarProvider.isHoveredOnAboutMe
                                    ? FontWeight.w600
                                    : null,
                                color: navBarProvider.isHoveredOnAboutMe
                                    ? ConstColors.primaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        onEnter: (event) {
                          navBarProvider.changeHoveredState(true, "skills");
                        },
                        onExit: (event) {
                          navBarProvider.changeHoveredState(false, "skills");
                        },
                        child: GestureDetector(
                          onTap: onSkillsPressed,
                          child: Text(
                            "Fähigkeiten",
                            style: GoogleFonts.ubuntu(
                                fontSize:
                                    navBarProvider.isHoveredOnSkills ? 22 : 20,
                                fontWeight: navBarProvider.isHoveredOnSkills
                                    ? FontWeight.w600
                                    : null,
                                color: navBarProvider.isHoveredOnSkills
                                    ? ConstColors.primaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        onEnter: (event) {
                          navBarProvider.changeHoveredState(true, "projects");
                        },
                        onExit: (event) {
                          navBarProvider.changeHoveredState(false, "projects");
                        },
                        child: GestureDetector(
                          onTap: onProjectsPressed,
                          child: Text(
                            "Projekte",
                            style: GoogleFonts.ubuntu(
                                fontSize: navBarProvider.isHoveredOnProjects
                                    ? 22
                                    : 20,
                                fontWeight: navBarProvider.isHoveredOnProjects
                                    ? FontWeight.w600
                                    : null,
                                color: navBarProvider.isHoveredOnProjects
                                    ? ConstColors.primaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        onEnter: (event) {
                          navBarProvider.changeHoveredState(true, "connect");
                        },
                        onExit: (event) {
                          navBarProvider.changeHoveredState(false, "connect");
                        },
                        child: GestureDetector(
                          onTap: onConnectPressed,
                          child: Text(
                            "Kontakt",
                            style: GoogleFonts.ubuntu(
                                fontSize:
                                    navBarProvider.isHoveredOnConnect ? 22 : 20,
                                fontWeight: navBarProvider.isHoveredOnConnect
                                    ? FontWeight.w600
                                    : null,
                                color: navBarProvider.isHoveredOnConnect
                                    ? ConstColors.primaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  );
                })
        ],
      ),
    );
  }
}
