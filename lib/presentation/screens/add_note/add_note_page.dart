import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_custom_appbar.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_textfield.dart';
import 'package:mini_project_note_app_api_bloc/presentation/widgets/custom_btn.dart';

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
          body: Column(
            children: <Widget>[
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        const AddCustomTextField(
                          controller: null,
                          hintText: 'Title',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        kHeight(20),
                        AddDateAndStateWidget(
                          checkboxCubit: checkboxCubit,
                        ),
                        const AddCustomTextField(
                          controller: null,
                          hintText: 'write your notes here .>.>.>',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: CustomFLoatingBTN(
            context: context,
            text: 'Create',
          )),
    );
  }
}
