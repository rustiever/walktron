import 'package:flutter/material.dart';

class MaterialTextField extends StatelessWidget {
  final bool enabled;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final String Function(String val) validator;

  const MaterialTextField({
    Key key,
    @required this.icon,
    this.controller,
    this.validator,
    @required this.hintText,
    this.enabled = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: TextFormField(
          enabled: enabled,
          validator: validator,
          controller: controller,
          onChanged: (String value) {},
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Material(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Icon(
                icon,
                color: Colors.red,
              ),
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          ),
        ),
      ),
    );
  }
}
