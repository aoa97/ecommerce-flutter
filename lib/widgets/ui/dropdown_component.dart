import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  final String value;
  final List<String> list;
  final void Function(String?)? onChanged;

  const DropDownComponent({
    required this.onChanged,
    required this.list,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down),
      onChanged: onChanged,
      items: list
          .map((val) => DropdownMenuItem(value: val, child: Text(val)))
          .toList(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey, width: 0.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red, width: 0.4),
        ),
      ),
    );
  }
}
