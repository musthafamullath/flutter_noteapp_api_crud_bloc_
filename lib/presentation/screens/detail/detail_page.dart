import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_note_app_api_bloc/core/colors.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/widgets/add_textfield.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/detail/widgets/details_custom_appbar.dart';
import 'package:mini_project_note_app_api_bloc/presentation/widgets/custom_btn.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.square(100),
          child: DetailsCustomAppbar(),
        ),
        body: Column(
          children: <Widget>[
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
                        onChanged: null,
                      ),
                      kHeight(20),
                      const AddDateAndStateWidget(),
                      const AddCustomTextField(
                        controller: null,
                        hintText: 'write your notes here .>.>.>',
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
        floatingActionButton: CustomFLoatingBTN(context: context, text: "Save"),
      ),
    );
  }

  // Visibility _customSaveBTN(
  //   BuildContext context,
  //   // GlobalKey<FormState> formKey,
  // ) {
  //   return Visibility(
  //     visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
  //     child: MaterialButton(
  //       minWidth: MediaQuery.of(context).size.width * 2 / 10,
  //       height: MediaQuery.of(context).size.height * 0.50 / 10,
  //       color: kBlue.withOpacity(0.5).withRed(9999),
  //       onPressed: () {},
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(7.5),
  //       ),
  //       child: Text(
  //         "Save",
  //         style: GoogleFonts.k2d(
  //           color: Colors.white,
  //           fontSize: 16,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
