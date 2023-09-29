import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  final TextEditingController? controller;
  final String? texto;
  final String? Function(String?)? validator;
  const TextFieldPage({super.key, this.controller, this.texto, this.validator});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        border: const OutlineInputBorder(),
        prefixText: "   ",
        hintText: widget.texto,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
