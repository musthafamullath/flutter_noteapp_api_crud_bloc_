import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/data/models/note_model.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.notes,
  });
  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    DateTime inputDateTime = DateTime.parse(notes.createAt!);
    String formattedDateTime =
        DateFormat('hh:mm a | dd MMM').format(inputDateTime);
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
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
              notes.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.k2d(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            kHeight(14),
            Text(
              notes.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                color: kTextLightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formattedDateTime,
                  style: GoogleFonts.k2d(
                    fontSize: 10,
                    color: kTextLightGrey,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                        notes.isCompleted ? Colors.purpleAccent : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
