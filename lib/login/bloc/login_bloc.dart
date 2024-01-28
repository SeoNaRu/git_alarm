import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/login/bloc/login_state.dart';
import 'package:git_commit/my/my_env.dart';
import 'package:git_commit/repository/authentication_repository.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(LoginState.init()) {
    on<GitHubName>(_onGitHubName);
    on<GitHubLogin>(_onGitHubLogin);
  }
  FutureOr<void> _onGitHubName(GitHubName event, emit) async {
    try {
      emit(state.copyWith(githubLoading: true));
      emit(state.copyWith(commitMessage: '조회중...'));
      dynamic response = await _authenticationRepository.githubGet(
          'api.github.com', '/users/${event.nickName}/repos');
      if (response.statusCode == 200) {
        List repos = json.decode(response.body);
        var today = DateTime.now();
        for (var repo in repos) {
          dynamic userResponse = await _authenticationRepository.githubGet(
              'api.github.com',
              '/repos/${event.nickName}/${repo['name']}/commits');
          if (userResponse.statusCode == 200) {
            List commits = json.decode(userResponse.body);
            bool commitToday = commits.any((commit) {
              DateTime commitDate =
                  DateTime.parse(commit['commit']['committer']['date']);
              return commitDate.year == today.year &&
                  commitDate.month == today.month &&
                  commitDate.day == today.day;
            });
            if (commitToday) {
              emit(state.copyWith(githubLoading: commitToday));
              emit(state.copyWith(
                  commitMessage:
                      '오늘 ${event.nickName} 커밋이 있습니다: ${repo['name']}'));
            }
          }
        }
        emit(state.copyWith(githubLoading: false));
        state.commitMessage == '조회중...'
            ? emit(state.copyWith(commitMessage: '오늘 커밋이 없습니다'))
            : emit(state.copyWith(commitMessage: state.commitMessage));
      } else {
        emit(state.copyWith(
            commitMessage: '레포지토리 조회 실패: ${response.statusCode}'));
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }

  FutureOr<void> _onGitHubLogin(GitHubLogin event, emit) async {
    // launchUrlString(
    //     'https://github.com/login/oauth/authorize?client_id=${MyEnv.clientId}');
    // // GitHub 로그인 URL 생성
    final url = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': MyEnv.clientId,
      'scope': 'read:user user:email',
    });

    // 사용자를 인증 페이지로 리디렉션
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: MyEnv.callbackUrlScheme);

    // 인증 코드 추출
    final code = Uri.parse(result).queryParameters['code'];

    // 인증 코드를 사용하여 사용자 토큰 받기
    final response = await http.post(
      Uri.https('github.com', '/login/oauth/access_token'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'client_id': MyEnv.clientId,
        'client_secret': MyEnv.clientSecret,
        'code': code,
      },
    );

    // 토큰 추출
    final token = json.decode(response.body)['access_token'];

    // 토큰을 사용하여 사용자 정보 가져오기
    final userResponse = await http.get(
      Uri.https('api.github.com', '/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final userData = json.decode(userResponse.body);
    print(userData); // 사용자 정보 출력
  }
}
