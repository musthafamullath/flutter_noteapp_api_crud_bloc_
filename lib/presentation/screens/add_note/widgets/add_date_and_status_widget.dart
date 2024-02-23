import 'package:flutter/material.dart';
import 'package:mini_project_note_app_api_bloc/core/constants.dart';

class AddDateAndStateWidget extends StatelessWidget {
  const AddDateAndStateWidget({
    super.key, this.dateAndTime, this.isCompleted,
  });
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
                
                // const Spacer(),
                // Transform.scale(
                //   scale: 0.8,
                //   child: Checkbox(
                //     value: null,
                //     onChanged: null,
                //   ),
                // )
              ],
            )
          ],
        )
      ],
    );
  }
}