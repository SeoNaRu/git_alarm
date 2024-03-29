import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../my/my_env.dart';

class AuthenticationRepository {
  Future<dynamic> testGet(
    String myAuthority,
    String unencodedPath,
  ) async {
    Uri url = Uri.parse('http://$myAuthority$unencodedPath');
    debugPrint(url.toString());
    try {
      http.Response response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
      });

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      debugPrint(']-----] e : ${e.toString()} [-----[');
    }
  }

  Future<dynamic> testPost(
      String myAuthority, String unencodedPath, Object body) async {
    Uri url = Uri.parse('http://$myAuthority$unencodedPath');
    try {
      debugPrint("$url $body PassPost Url Body");
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
          // 'Content-Length': '<calculated when request is sent>',
          // 'Host': '<calculated when request is sent>'
        },
        body: utf8.encode(jsonEncode(body)),
      );

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      // _controller.add(AuthenticationStatus.unauthenticated);
      debugPrint(']-----] e passPost : ${e.toString()} [-----[');
    }
  }

  Future<dynamic> passGet(
      String myAuthority, String unencodedPath, String accessToken) async {
    Uri url = Uri.parse('https://$myAuthority$unencodedPath');
    debugPrint(url.toString());
    try {
      http.Response response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken",
      });

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      debugPrint(']-----] e : ${e.toString()} [-----[');
    }
  }

  Future<dynamic> passPost(
      String myAuthority, String unencodedPath, Object body) async {
    Uri url = Uri.parse('https://$myAuthority$unencodedPath');
    try {
      debugPrint("$url $body PassPost Url Body");
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
          // 'Content-Length': '<calculated when request is sent>',
          // 'Host': '<calculated when request is sent>'
        },
        body: utf8.encode(jsonEncode(body)),
      );

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      // _controller.add(AuthenticationStatus.unauthenticated);
      debugPrint(']-----] e passPost : ${e.toString()} [-----[');
    }
  }

  Future<dynamic> githubGet(
    String myAuthority,
    String unencodedPath,
  ) async {
    Uri url = Uri.parse('https://$myAuthority$unencodedPath');

    try {
      http.Response response = await http.get(url, headers: {
        "Authorization": "token ${MyEnv.githubKey}",
      });
      return response;
    } catch (e) {
      debugPrint(']-----] e : ${e.toString()} [-----[');
    }
  }

  Future<dynamic> gitLoginGet(
    String myAuthority,
  ) async {
    Uri url = Uri.parse(myAuthority);
    debugPrint(url.toString());
    try {
      http.Response response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
      });

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      debugPrint(']-----] e : ${e.toString()} [-----[');
    }
  }
}
