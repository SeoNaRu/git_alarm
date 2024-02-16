import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/login/bloc/login_state.dart';

import 'package:git_commit/repository/authentication_repository.dart';

import 'package:hive/hive.dart';

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
    dynamic response = await _authenticationRepository.gitLoginGet(event.Uri);

    var box = await Hive.openBox('auth');

    await box.put('accessToken', response['access_token']);

    final accessToken = await box.get('accessToken');
    print('$accessToken');
    dynamic response1 = await _authenticationRepository.passGet(
        'github-alarm.vercel.app', '/api/userData', accessToken);
    print('유저 정보 $response1 ');
  }
}
