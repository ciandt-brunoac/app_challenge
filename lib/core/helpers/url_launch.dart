import 'package:url_launcher/url_launcher.dart';

void goToUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.inAppBrowserView,
    );
  } else {
    throw 'Could not launch $url';
  }
}
