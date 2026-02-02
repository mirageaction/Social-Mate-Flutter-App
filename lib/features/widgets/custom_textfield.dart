import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode!.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelStyle: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: _isFocused
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant,
        ),
        floatingLabelStyle: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: _isFocused
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant,
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
      ),
    );
  }
}
