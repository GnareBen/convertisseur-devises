import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const MyDropdownButton({super.key, required this.label, required this.controller});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {

  @override
  Widget build(BuildContext context) {
    const List<String> currencies = [
      'XOF',
      'USD',
      'AED',
      'AMD',
    ];

    String dropdownValue = currencies.first;

    return DropdownMenu(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      initialSelection: currencies.first,
      controller: widget.controller,
      dropdownMenuEntries: currencies.map<DropdownMenuEntry<String>>((item) {
        return DropdownMenuEntry<String>(
          value: item.toString(),
          label: item,
        );
      }).toList(),
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
