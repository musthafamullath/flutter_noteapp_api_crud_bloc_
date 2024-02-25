
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/data/models/note_model.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';

// class CustomFLoatingBTN extends StatelessWidget {
//   const CustomFLoatingBTN({
//     super.key,
//     required this.context,required this.text,
//   });

//   final BuildContext context;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//         visible: MediaQuery.of(context).viewInsets.bottom ==.0,
//         child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width * 2 / 10,
//         height: MediaQuery.of(context).size.height * 0.50 / 10,
//           color: kBlue.withOpacity(0.5).withRed(9999),
//           onPressed: (){},
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(7.5),
//           ),
//           child: Text(
//             text,
//             style: GoogleFonts.k2d(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600),
//           ),
//         ),
//       );
//   }
// }



  Visibility customSaveBTN(
    BuildContext context,
    GlobalKey<FormState> formKey,
    NoteModel notes,
  ) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 2 / 10,
        height: MediaQuery.of(context).size.height * 0.50 / 10,
        color: kBlue.withOpacity(0.5).withRed(9999),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Save",
          style: GoogleFonts.k2d(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }



  Visibility customCreateBTN({
    required BuildContext context,
    required String title,
    required String description,
    required NoteBloc noteBloc,
    required GlobalKey<FormState> formKey,
  }) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 2 / 10,
        height: MediaQuery.of(context).size.height * 0.50 / 10,
        color: kBlue.withOpacity(0.5).withRed(9999),
        onPressed: () {
          debugPrint('${context.read<CheckboxCubit>().state}');
          if (formKey.currentState!.validate()) {
            final newNote = NoteModel(
              title: title,
              description: description,
              isCompleted: context.read<CheckboxCubit>().state,
            );
            noteBloc.add(
              NoteAddEvent(note: newNote),
            );
          } else {
            customSnackbar(context, "Fill all forms");
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Create",
          style: GoogleFonts.k2d(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }