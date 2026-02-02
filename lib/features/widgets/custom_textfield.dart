import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelStyle: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: colorScheme.error,
            );
          }

          if (states.contains(WidgetState.focused)) {
            return textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: colorScheme.primary,
            );
          }

          return textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurfaceVariant,
          );
        }),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
