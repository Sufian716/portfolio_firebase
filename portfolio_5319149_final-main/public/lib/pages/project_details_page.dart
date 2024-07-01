import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:provider/provider.dart';

class ProjectsDetailsPage extends StatefulWidget {
  const ProjectsDetailsPage({super.key});

  @override
  State<ProjectsDetailsPage> createState() => _ProjectsDetailsPageState();
}

class _ProjectsDetailsPageState extends State<ProjectsDetailsPage> {
  final ScrollController _screenShotsScrollController = ScrollController();
  @override
  void dispose() {
    _screenShotsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider =
        Provider.of<ProjectProvider>(context, listen: false);
    final ProjectModel project =
        projectProvider.projects[projectProvider.selectedProject];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ConstColors.primaryColor, ConstColors.secondaryColor],
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(
                  10,
                ),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    "Projektinformationen",
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  Text(
                    project.projectName,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Über das Projekt:",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    project.projectDescription,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Verwendeter Technologie-Stack:",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: project.techStack.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              project.techStack[index],
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: 1.5),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            child: Scrollbar(
              controller: _screenShotsScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: ListView.builder(
                  controller: _screenShotsScrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: project.images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(project.images[index]),
                          ),
                        ),
                        Text(
                          "Bildschirmfoto ${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.5),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
