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
              // maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.k2d(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            kHeight(14),
            Text(
              notes.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
           const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formattedDateTime,
                  style: GoogleFonts.k2d(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 15,height: 30,child: VerticalDivider(
                  thickness: 3,color: Colors.grey,
                )),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        notes.isCompleted ? Colors.greenAccent : Colors.orangeAccent,
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
