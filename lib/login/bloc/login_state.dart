import 'dart:ffi';

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool githubLoading;

  const LoginState({
    required this.githubLoading,
  });

  factory LoginState.init() {
    return const LoginState(
      githubLoading: false,
    );
  }

  @override
  String toString() {
    return 'LoginState{status: $githubLoading}';
  }

  @override
  List<Object?> get props => [githubLoading];

  LoginState copyWith({
    bool? githubLoading,
  }) {
    return LoginState(
      githubLoading: githubLoading ?? this.githubLoading,
    );
  }
}
