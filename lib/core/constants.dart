import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:page_transition/page_transition.dart';

kWidth(double width) {
  return SizedBox(
    width: width,
  );
}

kHeight(double height) {
  return SizedBox(
    height: height,
  );
}

void customSnackbar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      content: Text(
        message,
        style: GoogleFonts.k2d(
          fontSize: 13,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: kDarkSlightlyGreenishGrey,
      duration: const Duration(milliseconds: 1200),
    ),
  );
}

nextScreen(context, page) {
  return Navigator.push(
    context,
    PageTransition(
      child: page,
      type: PageTransitionType.fade,
    ),
  );
}
