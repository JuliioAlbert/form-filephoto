part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginEvent extends AuthEvent {
  final bool isLoading;

  const OnLoginEvent(this.isLoading);
}
