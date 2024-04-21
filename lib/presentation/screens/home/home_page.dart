import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_note_app_api_bloc/bloc/note_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/add_note_page.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/detail_page.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/home/widgets/home_custom_appbar.dart';
import 'widgets/home_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteBloc = context.read<NoteBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      context.read<NoteBloc>().add(NoteInitialFetchEvent());
    });
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.square(95),
          child: CustomAppbar(),
        ),
        body: BlocConsumer<NoteBloc, NoteState>(
          listenWhen: (previous, current) => current is NoteActionState,
          buildWhen: (previous, current) => current is! NoteActionState,
          listener: (context, state) {
            if (state is NoteAddSuccessActionState) {
              Navigator.pop(context);
              customSnackbar(context, "New note added");
            } else if (state is NoteAddErrorActionState) {
              customSnackbar(context, "Error creating new note");
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case NoteFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(
                    color: kBlue,
                  ),
                );
              case NoteFetchingSuccessState:
                final successState = state as NoteFetchingSuccessState;
                return successState.notes.isNotEmpty
                    ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemCount: successState.notes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              nextScreen(
                                context,
                                DetailPage(
                                  notes: successState.notes[index],
                                  noteBloc: noteBloc,
                                ),
                              );
                            },
                            child: HomeCardWidget(
                              notes: successState.notes[index],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No notes found!!...'),
                      );
              default:
                return const SizedBox(
                  child: Center(
                    child: Text("couldn't load!!!..."),
                  ),
                );
            }
          },
        ),
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: FloatingActionButton(
            onPressed: () {
              nextScreen(
                context,
                AddNotePage(
                  noteBloc: noteBloc,
                ),
              );
            },
            backgroundColor: kBlue.withOpacity(0.5),
            shape: const CircleBorder(),
            elevation: 0,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
