import 'package:url_launcher/url_launcher.dart';

class LinkHelper {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> sendEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch email to $email');
    }
  }
}
