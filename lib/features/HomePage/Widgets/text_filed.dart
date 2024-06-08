import 'package:flutter/material.dart';

class CustomTExtField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const CustomTExtField(
      {super.key,
      required this.textEditingController,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
