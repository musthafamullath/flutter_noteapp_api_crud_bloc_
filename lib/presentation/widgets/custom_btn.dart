

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


