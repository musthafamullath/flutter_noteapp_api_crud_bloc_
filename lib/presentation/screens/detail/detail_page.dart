import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/data/models/note_model.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_textfield.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/cubit/button_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/widgets/details_custom_appbar.dart';
import 'package:mini_project_note_app_api_bloc/presentation/widgets/custom_btn.dart';

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
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      AddCustomTextField(
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
}
