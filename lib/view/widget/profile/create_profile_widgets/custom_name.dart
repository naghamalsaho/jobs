// import 'package:flutter/material.dart';
// import 'package:jobs/core/functions/validinput.dart';
// import 'package:jobs/view/widget/general/custom_text_field.dart';

// class CustomName extends StatelessWidget {
//   TextEditingController controller1;
//   TextEditingController controller2;
//   CustomName({super.key, required this.controller1, required this.controller2});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         SizedBox(
//           width: 160,
//           child: CustomTextFieldInfo(
//             icon: Icons.person_outline,
//             label: "first name ",
//             hint: "first name ",
//             mycontroller: controller1,
//             valid: (val) {
//               return validInput(val!, 5, 12, "username");
//             },
//           ),
//           //  CustomTextFormAuth(
//           //   valid: (val) {
//           //     return validInput(val!, 5, 20, "username");
//           //   },
//           //   mycontroller: controller1,
//           //   hinttext: "first name ",
//           //   labeltext: "first name ",
//           //   iconData: Icons.person_outline,
//           // )
//         ),
//         SizedBox(
//           width: 160,
//           child: CustomTextFieldInfo(
//             icon: Icons.person_outline,
//             label: "last name ",
//             hint: "last name ",
//             mycontroller: controller2,
//             valid: (val) {
//               return validInput(val!, 5, 12, "username");
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
