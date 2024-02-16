import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/login/bloc/login_bloc.dart';
import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/my/my_env.dart';
import 'package:git_commit/router/route_conf.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OAuthWebView extends StatefulWidget {
  const OAuthWebView({super.key});

  @override
  State<OAuthWebView> createState() => _OAuthWebViewState();
}

class _OAuthWebViewState extends State<OAuthWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .contains("https://github-alarm.vercel.app/api/accessToken")) {
              print(request.url);
              context.read<LoginBloc>().add((GitHubLogin(Uri: request.url)));
              GoRouter.of(context).go(RoutePath.home);
              return NavigationDecision.prevent; // URL 이동을 방지하고, 추가 로직 처리
            }
            return NavigationDecision.navigate; // 그 외의 URL에 대해서는 웹뷰 내 이동을 허용
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://github.com/login/oauth/authorize?client_id=${MyEnv.clientId}'));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('뒤로'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
