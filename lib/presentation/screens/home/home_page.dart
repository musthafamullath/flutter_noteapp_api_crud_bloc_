import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.square(95),
          child: CustomAppbar(),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  nextScreen(context, const DetailPage());
                },
                child: const HomeCardWidget());
          },
        ),
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: FloatingActionButton(
            onPressed: () {
              nextScreen(context,const AddNotePage(),);
            },
            backgroundColor: kBlue.withOpacity(0.5).withRed(9999),
            shape:const CircleBorder(),
            elevation: 0,
            child: const Icon(Icons.add,color: Colors.white,size: 32,),
          ),
        ),
      ),
    );
  }
}
