part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;

  bool get isLoadingG => isLoading == true;

  const AuthState({
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  AuthState copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [email, password, isLoading];
}
