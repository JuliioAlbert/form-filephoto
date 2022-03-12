import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_validations/domain/bloc/blocs.dart';

import 'package:forms_validations/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("Login", style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  const _LoginForm(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text("Crear una nueva cuenta",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Form(
      key: authBloc.formKey, //Form Key
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomFormField(
            keyboardType: TextInputType.emailAddress,
            label: "Correo",
            hintText: "correo@correo.com",
            prefixIcon: Icons.alternate_email_rounded,
            validator: (String? value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              final regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : "Email no valido";
            },
          ),
          const SizedBox(height: 20),
          CustomFormField(
            keyboardType: TextInputType.text,
            label: "Password",
            hintText: "****",
            obscureText: true,
            prefixIcon: Icons.lock_clock_sharp,
            validator: (value) {
              if (value != null && value.length >= 6) {
                return null;
              } else {
                return "minimo de 6";
              }
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: () {
              authBloc.isValidForm();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: const Text(
                "Ingresar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
