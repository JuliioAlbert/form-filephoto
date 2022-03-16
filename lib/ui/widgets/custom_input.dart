import 'package:flutter/material.dart';
import 'package:forms_validations/ui/theme/themes.dart';

class CustomFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String label, hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autocorrect: false,
      keyboardType: keyboardType,
      decoration: InputDecorations.authDecoration(
        hintext: hintText,
        label: label,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
