import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/pages/project_details_page.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  final ScrollController _projectsScrollController = ScrollController();
  @override
  void dispose() {
    _projectsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider =
        Provider.of<ProjectProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SectionTitle(sectionTitle: "Projekte"),
        const SizedBox(height: 50),
        SizedBox(
          height: 350,
          child: ListView.builder(
            controller: _projectsScrollController,
            shrinkWrap: true,
            itemCount: projectProvider.projects.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final project = projectProvider.projects[index];
              return Container(
                width: 350,
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          project.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      project.projectName,
                      style:
                          GoogleFonts.vt323(fontSize: 28, letterSpacing: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (project.projectName.toLowerCase() ==
                            "coming soon") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text("Demnächst verfügbar"),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        } else {
                          projectProvider.changeSelectedProject(index);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProjectsDetailsPage(),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weitere Details",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: ConstColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
