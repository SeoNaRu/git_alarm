import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class NavNarBlocEvent extends Equatable {
  const NavNarBlocEvent();

  @override
  List<Object> get props => [];
}

class BotNavNumber extends NavNarBlocEvent {
  final int botNav;

  const BotNavNumber({
    required this.botNav,
  });
}
