import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forms_validations/domain/bloc/blocs.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final formKey = GlobalKey<FormState>();

  AuthBloc() : super(const AuthState()) {
    on<OnLoginEvent>(
        (event, emit) => emit(state.copyWith(isLoading: event.isLoading)));
  }

  Future<void> onLogin() async {
    add(const OnLoginEvent(true));
    await Future.delayed(const Duration(seconds: 2));
    add(const OnLoginEvent(false));
  }

  bool isValidForm() {
    print('ValidateForm => ${formKey.currentState?.validate()}');

    return formKey.currentState?.validate() ?? false;
  }
}
