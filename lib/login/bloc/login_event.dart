import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GitHubName extends LoginEvent {
  final String nickName;

  const GitHubName({
    required this.nickName,
  });
}

class GitHubLogin extends LoginEvent {
  final String Uri;
  const GitHubLogin({
    required this.Uri,
  });
}
