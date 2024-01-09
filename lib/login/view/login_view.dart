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
  bool _isLoading = false;
  String _commitMessage = 'Commit 상태를 조회하세요.';

  void checkUserCommits(String username) async {
    setState(() {
      _isLoading = true;
      _commitMessage = '조회 중...';
    });
    var headers = {
      'Authorization':
          'token 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'
    };

    var reposUrl = Uri.parse('https://api.github.com/users/$username/repos');
    var reposResponse = await http.get(reposUrl, headers: headers);

    if (reposResponse.statusCode == 200) {
      List repos = json.decode(reposResponse.body);
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

      setState(() {
        _commitMessage =
            _commitMessage == '조회 중...' ? '오늘 커밋이 없습니다.' : _commitMessage;
        _isLoading = false;
      });
    } else {
      setState(() {
        _commitMessage = '레포지토리 조회 실패: ${reposResponse.statusCode}';
        _isLoading = false;
      });
    }
  }

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
                  SizedBox(height: 10),
                  if (state.githubLoading)
                    CircularProgressIndicator()
                  else
                    Text(state.commitMessage),
                  SizedBox(height: 10),
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
