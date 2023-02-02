import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;

  const QTextField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    required this.onChanged,
    this.obscure = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      validator: widget.validator,
      maxLength: widget.maxLength,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        suffixIcon: Icon(
          widget.suffixIcon ?? Icons.text_format,
        ),
        helperText: widget.hint,
      ),
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
