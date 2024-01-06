import 'dart:async';

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

      print(response);
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
