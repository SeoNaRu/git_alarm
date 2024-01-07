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
          var commitsUrl = Uri.parse(
              'https://api.github.com/repos/$username/${repo['name']}/commits');
          var commitsResponse = await http.get(commitsUrl, headers: headers);

          if (commitsResponse.statusCode == 200) {
            List commits = json.decode(commitsResponse.body);

            bool commitToday = commits.any((commit) {
              DateTime commitDate =
                  DateTime.parse(commit['commit']['committer']['date']);
              return commitDate.year == today.year &&
                  commitDate.month == today.month &&
                  commitDate.day == today.day;
            });

            if (commitToday) {
              setState(() {
                _commitMessage = '오늘 $username의 커밋이 있습니다: ${repo['name']}';
                _isLoading = false;
                return;
              });
            }
          }
        }
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
