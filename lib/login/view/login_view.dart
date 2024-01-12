import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/login/bloc/login_bloc.dart';
import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/login/bloc/login_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('하이'),
        ),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'GitHub 사용자 이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (state.githubLoading)
                    CircularProgressIndicator()
                  else
                    Text(state.commitMessage),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: state.githubLoading
                        ? null
                        : () {
                            context.read<LoginBloc>().add((GitHubName(
                                nickName: _usernameController.text)));
                          },
                    child: Text('Commit 조회하기'),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
