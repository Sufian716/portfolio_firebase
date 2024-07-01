import 'package:portfolio/utils/helpers/print_error.dart';
import 'package:url_launcher/url_launcher.dart';

void launchLink({required String profileLink}) async {
  try {
    await launchUrl(Uri.parse(profileLink));
  } catch (e) {
    printError(e as Exception);
  }
}
