import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/repository/authentication_repository.dart';
import 'package:git_commit/router/bloc/nav_nar_bloc_event.dart';

import 'package:git_commit/router/bloc/nav_nar_bloc_state.dart';

class NavNarBlocBloc extends Bloc<NavNarBlocEvent, NavNarBlocState> {
  final AuthenticationRepository _authenticationRepository;
  NavNarBlocBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(NavNarBlocState.init()) {
    on<BotNavNumber>(_onBotNavNumber);
  }
  FutureOr<void> _onBotNavNumber(BotNavNumber event, emit) async {
    emit(state.copyWith(navNumber: event.botNav));
  }
}
