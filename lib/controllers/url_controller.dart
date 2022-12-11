import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController extends ChangeNotifier {
  Future<void> lauchHttps(String link, String path) async {
    Uri uri = Uri.https(link, path);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
    notifyListeners();
  }

  Future<void> lauchEmail() async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: 'dev.dancavalcanti@gmail.com',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    }
    notifyListeners();
  }
}
