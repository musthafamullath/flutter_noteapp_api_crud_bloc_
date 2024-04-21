import 'package:flutter/material.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';

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
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding:const EdgeInsets.all(20),
        
        decoration: BoxDecoration(
          color: kBlue.withOpacity(0.075),
          borderRadius: BorderRadius.circular(25)
        ),
        child: TextFormField(
          
          maxLines: maxLines,
          maxLength: maxLength,
          controller: controller,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            
          ),
          
          decoration: InputDecoration(
            
            errorMaxLines: 10,
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
            border: InputBorder.none,
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
      ),
    );
  }
}
