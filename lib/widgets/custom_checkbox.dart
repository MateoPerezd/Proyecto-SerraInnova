import 'package:flutter/material.dart';

//=========================
// BOTON CHECKBOX
//======================

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14, 
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: Color(0xFF1F2A7A),
          ),
      ) ,
      value: value, 
      tristate: false,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
    
  }
}
