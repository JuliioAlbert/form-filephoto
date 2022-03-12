import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final formKey = GlobalKey<FormState>();

  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  bool isValidForm() {
    print('ValidateForm => ${formKey.currentState?.validate()}');

    return formKey.currentState?.validate() ?? false;
  }
}
