import 'package:url_launcher/url_launcher.dart';

mixin class LaunchUrl {
  final Uri _url = Uri.parse("https://www.google.com.br");
  Future<void> urlLaunch() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
