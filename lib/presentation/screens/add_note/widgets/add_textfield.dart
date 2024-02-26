import 'package:flutter/material.dart';

class AddCustomTextField extends StatelessWidget {
  const AddCustomTextField({
    super.key,
    required this.hintText,
    required this.fontSize,
    required this.fontWeight,
    this.onChanged,
    this.controller,
    required this.maxLines,
    required this.maxLength,
  });
  final String hintText;
  final int maxLines;
  final int  maxLength;
  final double fontSize;
  final FontWeight fontWeight;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextFormField(
        
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          
        ),
        
        decoration: InputDecoration(
          
          errorMaxLines: 1,
          errorText: '',
          errorStyle: const TextStyle(
            height: 0,
            fontSize: 0,
            color: Colors.green,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
        width: 5
      ),
          ),
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
