import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/login/bloc/login_state.dart';
import 'package:git_commit/repository/authentication_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(LoginState.init()) {
    on<GitHubName>(_onGitHubName);
  }
  FutureOr<void> _onGitHubName(GitHubName event, emit) async {
    try {
      dynamic response = await _authenticationRepository.githubGet(
          'api.github.com', '/users/${event.nickName}/repos}');

      if (response.statusCode == 200) {
        List repos = json.decode(response.body);
        var today = DateTime.now();

        for (var repo in repos) {
          dynamic response = await _authenticationRepository.githubGet(
              'api.github.com',
              'repos/${event.nickName}/${repo['name']}/commits');
        }
        if (response.statusCode == 200) {
          List commits = json.decode(response.body);

          bool commitToday = commits.any((commit) {
            DateTime commitDate =
                DateTime.parse(commit['commit']['committer']['date']);
            return commitDate.year == today.year &&
                commitDate.month == today.month &&
                commitDate.day == today.day;
          });
        }
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
