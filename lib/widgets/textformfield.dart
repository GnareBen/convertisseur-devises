import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const MyTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        label: Text('amount'),
      ),
    );
  }
}
