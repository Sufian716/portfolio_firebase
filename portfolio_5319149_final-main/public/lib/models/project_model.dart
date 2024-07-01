class ProjectModel {
  final String projectName;
  final String projectDescription;
  final List<String> techStack;
  final List<String> images;

  ProjectModel({
    required this.projectName,
    required this.projectDescription,
    required this.images,
    required this.techStack,
  });
}
