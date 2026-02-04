import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool requiredField;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onTap;
  

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.requiredField = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.readOnly = false, 
    this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          requiredField ? '$label *' : label,
          style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14, 
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: Color(0xFF1F2A7A),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          onTap: onTap,
           validator: validator ??
      (requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Este campo es obligatorio';
              }
              return null;
            }
          : null),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}