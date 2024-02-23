import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kShadedWhite,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "noteTitle",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.k2d(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            kHeight(14),
            const Text(
              "NoteDescription",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 10,
                  color: kTextLightGrey,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "FormatTimeAndDate",
                  style: GoogleFonts.k2d(
                      fontSize: 10, color: kTextLightGrey),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: kGreen,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}