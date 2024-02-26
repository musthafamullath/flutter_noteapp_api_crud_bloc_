import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/add_note/cubit/checkbox_cubit.dart';

class AddDateAndStateWidget extends StatelessWidget {
  const AddDateAndStateWidget({
    super.key,
    this.dateAndTime,
    this.isCompleted,
    required this.checkboxCubit,
  });
  final CheckboxCubit checkboxCubit;
  final String? dateAndTime;
  final bool? isCompleted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Icon(
              Icons.access_time_filled_rounded,
              size: 18,
            ),
            kWidth(5),
            const Text(
              "Date Create :",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            const Spacer(),
            Text(
              dateAndTime ?? '${DateTime.now()}',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        kHeight(20),
        Row(
          children: <Widget>[
            const Icon(
              Icons.auto_mode_outlined,
              size: 18,
            ),
            kWidth(5),
            const Text(
              "Completed :",
              style: TextStyle(fontSize: 13),
            ),
            const Spacer(),
            BlocBuilder<CheckboxCubit, bool>(
              builder: (context, state) => Transform.scale(
                scale: 1,
                origin: Offset.zero,
                child: Checkbox(
                  value: state,
                  onChanged: (bool? value) => checkboxCubit.isChecked(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
