import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';

class AddCustomAppbar extends StatelessWidget {
  const AddCustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(top: 20, right: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         const Spacer(),
          Text(
            'Add New Note',
            style: GoogleFonts.k2d(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          kWidth(10),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
