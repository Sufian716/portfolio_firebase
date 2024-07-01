import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';

class ProjectProvider extends ChangeNotifier {
  int selectedProject = 0;

  List<ProjectModel> projects = [
    ProjectModel(
      projectName: "Portfolio Website",
      projectDescription:
          "Eine Portfolio-Website ist eine Online-Plattform, auf der man seine Arbeiten, Fähigkeiten und Erfolge zeigt. Sie dient als digitaler Lebenslauf oder Portfolio.",
      techStack: [
        "Flutter",
        "Dart",
      ],
      images: [
        "assets/projects/portfolio/image1.png",
        "assets/projects/portfolio/image2.png",
        "assets/projects/portfolio/image3.png",
        "assets/projects/portfolio/image4.png",
        "assets/projects/portfolio/image5.png",
      ],
    ),

    ProjectModel(
      projectName: "Rolloutkoordinator bei ZDF",
      projectDescription:
          "Ich war als Rolloutkoordinator beim ZDF tätig. In dieser Rolle habe ich die strategische Planung und Durchführung komplexer IT-Projekte übernommen. Dazu gehörten effektives Ressourcenmanagement und die taktische Teamkoordination. Mit großer Genauigkeit führte ich anspruchsvolle Funktionstests durch und stellte eine strenge Qualitätssicherung sicher. Darüber hinaus instruierte und bildete ich Teammitglieder weiter. Zu meinen Aufgaben zählten die profunde Konfiguration von Laptops und die gezielte Aktualisierung von iOS-Geräten. Ich überwachte kontinuierlich den Projektfortschritt und erstellte präzise Berichte. Zudem sorgte ich für eine genaue Prozessüberwachung und behob schnell Probleme vor Ort.",
      techStack: [
        "Sitetracker",
        "Matrix42",
        "Activ Directory",
      ],
      images: [
        "assets/projects/portfolio/zdf_logo.png",
        
      ],
    ),
    //coming soon project (default)
    ProjectModel(
      projectName: "Coming Soon",
      projectDescription: "",
      techStack: [],
      images: [
        "assets/projects/comingsoon/image1.gif",
      ],
    ),

    
  ];

  void changeSelectedProject(int index) {
    selectedProject = index;
  }
}
