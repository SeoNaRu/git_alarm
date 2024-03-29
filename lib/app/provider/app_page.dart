import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/app/app_view.dart';
import 'package:git_commit/login/bloc/login_bloc.dart';
import 'package:git_commit/router/bloc/nav_nar_bloc_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => NavNarBlocBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}
