import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/data/models/note_model.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_custom_appbar.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_textfield.dart';


class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
    required this.noteBloc,
  });
  final NoteBloc noteBloc;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late CheckboxCubit checkboxCubit;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime inputDateTime = DateTime.parse(DateTime.now().toString());
  late String formattedDateTime;
  @override
  void initState() {
    checkboxCubit = BlocProvider.of<CheckboxCubit>(context);
    checkboxCubit.resetChecked();
    formattedDateTime = DateFormat('hh:mm a | dd MMM yyyy').format(inputDateTime);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:
         FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.square(100),
          child: AddCustomAppbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                         AddCustomTextField(
                          maxLines: 1,
                          maxLength: 22,
                          controller: titleController,
                          hintText: 'Title',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        kHeight(20),
                        AddDateAndStateWidget(
                          checkboxCubit: checkboxCubit,
                          dateAndTime: formattedDateTime,
                        ),
                         AddCustomTextField(
                          maxLines: 20,
                          maxLength: 200,
                          controller: descriptionController,
                          hintText: 'write your notes here....',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: customCreateBTN(
          context: context,
          title: titleController.text,
          description: descriptionController.text,
          noteBloc: widget.noteBloc,
          formKey: formKey,
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
}
