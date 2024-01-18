import 'package:equatable/equatable.dart';

class NavNarBlocState extends Equatable {
  final int navNumber;

  const NavNarBlocState({
    required this.navNumber,
  });

  factory NavNarBlocState.init() {
    return const NavNarBlocState(
      navNumber: 1,
    );
  }

  @override
  String toString() {
    return 'NavNarBlocState{ navNumber: $navNumber }';
  }

  @override
  List<Object?> get props => [navNumber];

  NavNarBlocState copyWith({
    int? navNumber,
  }) {
    return NavNarBlocState(
      navNumber: navNumber ?? this.navNumber,
    );
  }
}
