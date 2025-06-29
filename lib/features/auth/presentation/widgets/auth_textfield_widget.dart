import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AuthTexFormFeildWidget extends StatelessWidget {
  const AuthTexFormFeildWidget({
    super.key,
    required this.hintext,
    this.validator,
    required this.obsecureText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
  });
  final String hintext;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        hintText: hintext,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 0.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 0.4),
        ),
      ),
    );
  }
}
