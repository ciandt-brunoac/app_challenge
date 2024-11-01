import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static String personalAccessToken = dotenv.get('PERSONAL_ACCESS_TOKEN');
}
