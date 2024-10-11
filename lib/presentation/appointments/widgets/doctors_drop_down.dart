// import 'package:flutter/material.dart';

// import '../../../model/doctors_response_model/datum.dart';

// class DoctorNamesDropDown extends StatelessWidget {
//   const DoctorNamesDropDown({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<Doctor>(
//       hint: Text('Select a Doctor'),
//       value: "selectedDoctor",
//       items: doctorList.map((Doctor doctor) {
//         return DropdownMenuItem<Doctor>(
//           value: doctor,
//           child: Text(doctor.name),
//         );
//       }).toList(),
//       onChanged: (Doctor? newDoctor) {
//         setState(() {
//           selectedDoctor = newDoctor;
//         });

//         // When a doctor is selected, print their ID or send it to the backend
//         print('Selected Doctor ID: ${selectedDoctor?.id}');
//       },
//       isExpanded: true,
//     );
//   }
// }
