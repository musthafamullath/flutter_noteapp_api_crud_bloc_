import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';

class DetailsCustomAppbar extends StatelessWidget {
  const DetailsCustomAppbar({
    super.key,
    required this.noteBloc,
    required this.noteId,
  });
  final NoteBloc noteBloc;
  final String noteId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 10, 15),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
                Text(
                  "Your Note",
                  style: GoogleFonts.k2d(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                PopupMenuButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: kRed,
                  child: const Icon(
                    Icons.more_vert_sharp,
                    size: 25,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      height: 8,
                      onTap: () {
                        noteBloc.add(NoteDeleteEvent(noteId: noteId,),);
                        context.read<NoteBloc>().add(NoteInitialFetchEvent(),);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Delete",
                        style: GoogleFonts.k2d(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: kTextLightGrey,
          )
        ],
      ),
    );
  }
}
