import 'package:portfolio/const/links.dart';
import 'package:portfolio/utils/helpers/print_error.dart';
import 'package:url_launcher/url_launcher.dart';

void downloadResume() async {
  try {
    await launchUrl(Uri.parse(Links.resumeLink));
  } catch (e) {
    printError(e as Exception);
  }
}
