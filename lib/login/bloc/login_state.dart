import 'dart:ffi';

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool githubLoading;
  final String commitMessage;

  const LoginState({
    required this.githubLoading,
    required this.commitMessage,
  });

  factory LoginState.init() {
    return const LoginState(
      githubLoading: false,
      commitMessage: 'Commit 상태를 조회하세요.',
    );
  }

  @override
  String toString() {
    return 'LoginState{status: $githubLoading commitMessage:$commitMessage}';
  }

  @override
  List<Object?> get props => [githubLoading, commitMessage];

  LoginState copyWith({
    bool? githubLoading,
    String? commitMessage,
  }) {
    return LoginState(
      githubLoading: githubLoading ?? this.githubLoading,
      commitMessage: commitMessage ?? this.commitMessage,
    );
  }
}
