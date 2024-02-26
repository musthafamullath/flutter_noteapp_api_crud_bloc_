import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/data/models/note_model.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_textfield.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/cubit/button_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/widgets/details_custom_appbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.notes,
    required this.noteBloc,
  });
  final NoteModel notes;
  final NoteBloc noteBloc;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool enableSaveBTN = false;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController = TextEditingController(text: widget.notes.title);
    descriptionController =
        TextEditingController(text: widget.notes.description);
    debugPrint(widget.notes.id);
    context.read<ButtonCubit>().resetBTN();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkboxCubit = BlocProvider.of<CheckboxCubit>(context);
    final buttonCubit = context.read<ButtonCubit>();
    DateTime inputDateTime = DateTime.parse(widget.notes.createAt!);
    String formattedDateTime =
        DateFormat('hh:mm a | dd MMM yyyy').format(inputDateTime);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: const Size.square(100),
          child: DetailsCustomAppbar(
            noteBloc: widget.noteBloc,
            noteId: widget.notes.id!,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                          onChanged: (value) {
                            buttonCubit.enableBTN();
                          },
                        ),
                        kHeight(20),
                        AddDateAndStateWidget(
                          checkboxCubit: checkboxCubit,
                          dateAndTime: formattedDateTime,
                          isCompleted: widget.notes.isCompleted,
                        ),
                        const Divider(),
                        AddCustomTextField(
                          maxLines: 20,
                          maxLength: 200,
                          controller: descriptionController,
                          hintText: 'write your notes here....',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<ButtonCubit, bool>(
          builder: (
            context,
            state,
          ) {
            return state
                ? customSaveBTN(
                    context,
                    formKey,
                    widget.notes,
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }

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
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final updatedNote = NoteModel(
              id: notes.id,
              title: titleController.text,
              description: descriptionController.text,
              isCompleted: context.read<CheckboxCubit>().state,
            );
            widget.noteBloc.add(NoteUpdateEvent(note: updatedNote));
          }
          Navigator.of(context).pop();
        },
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
}
