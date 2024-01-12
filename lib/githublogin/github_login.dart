import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubLogin extends StatefulWidget {
  const GithubLogin({super.key});

  @override
  State<GithubLogin> createState() => _GithubLoginState();
}

class _GithubLoginState extends State<GithubLogin> {
  // CLIENT_ID
  final String clientId = '';
  // CLIENT_SECRET
  final String clientSecret = '';
  // CALLBACK_URL
  final String callbackUrl = '';

  Future<void> signInWithGithub() async {
    final url = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': clientId,
      'redirect_uri': callbackUrl,
      'scope': 'read:user user:email',
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: Uri.parse(callbackUrl).scheme);

    final code = Uri.parse(result).queryParameters['code'];

    if (code != null) {
      final response = await http.post(
        Uri.https('github.com', '/login/oauth/access_token'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
        },
      );

      final accessToken = json.decode(response.body)['access_token'];
      // 여기서 accessToken을 사용하여 GitHub API에 요청할 수 있습니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithGithub();
          },
          child: Text('Login with GitHub'),
        ),
      ),
    );
  }
}
