import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  bool isHoveredOnAboutMe = false;
  bool isHoveredOnSkills = false;
  bool isHoveredOnProjects = false;
  bool isHoveredOnConnect = false;

  void changeHoveredState(bool state, String section) {
    if (section == "about me") {
      isHoveredOnAboutMe = state;
    } else if (section == "skills") {
      isHoveredOnSkills = state;
    } else if (section == "projects") {
      isHoveredOnProjects = state;
    } else if (section == "connect") {
      isHoveredOnConnect = state;
    }
    notifyListeners();
  }
}
