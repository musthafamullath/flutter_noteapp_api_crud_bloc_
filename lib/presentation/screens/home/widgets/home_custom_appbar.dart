import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';

import '../../../../core/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Keep Notes',
                  style: GoogleFonts.k2d(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<NoteBloc>().add(
                          NoteInitialFetchEvent(),
                        );
                  },
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: kGreen,
                        child: Icon(Icons.refresh_rounded),
                      ),
                      Text(
                        "Refresh",
                        style: GoogleFonts.k2d(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: kTextLightGrey,
          ),
        ],
      ),
    );
  }
}
