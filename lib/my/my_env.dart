import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyEnv {
  // static final String ip = dotenv.env['IP'] ?? '';
  // static final String testIp = dotenv.env['TEST_IP'] ?? '';
  // static final String ipRiot = dotenv.env['IP_RIOT'] ?? '';
  // static final String ipTft = dotenv.env['IP_TFT'] ?? '';
  static final String githubKey = dotenv.env['GITHUB_KEY'] ?? '';
  static final String clientId = dotenv.env['GITHUB_CLIENT_ID'] ?? '';
  static final String clientSecret = dotenv.env['GITHUB_CLIENT_SECRET'] ?? '';
  static final String callbackUrlScheme =
      dotenv.env['GITHUB_CALLBACK_URL_SCHEME'] ?? '';
}
