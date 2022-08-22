import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  final List<String> list;
  final String hint;
  final String value;
  final void Function(String?)? onChanged;

  const DropDownComponent(
      {required this.onChanged,
      required this.list,
      required this.hint,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      hint: Text(hint),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey, width: 0.4),
        ),
      ),
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      onChanged: onChanged,
      items: list.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
    );
  }
}
