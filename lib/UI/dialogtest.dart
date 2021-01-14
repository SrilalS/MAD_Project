// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Dtest extends StatefulWidget {
//   @override
//   _DtestState createState() => _DtestState();
// }

// class _DtestState extends State<Dtest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Club Details"),
//         backgroundColor: Color(0xFF90A4AE),
//       ),
//       body: Center(
//         child: RaisedButton(
//           padding: const EdgeInsets.all(8.0),
//           textColor: Colors.white,
//           color: Colors.blueGrey[600],
//           child: new Text("Edit"),
//           onPressed: () {
//             dialogTest("Drama Club", "Hello Drama Club",
//                 'https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png');
//           },
//         ),
//       ),
//     );
//   }

//   void dialogTest(
//     String clubName,
//     String description,
//     String imageUrl,
//   ) {
//     Get.dialog(AlertDialog(
//         title: Text(
//           'Edit Club Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                   width: Get.width, height: 50, child: Image.network(imageUrl)),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     clubName = value;
//                   });
//                 },
//                 initialValue: clubName,
//                 decoration: InputDecoration(
//                     hintText: clubName,
//                     labelText: 'Club Name',
//                     border: OutlineInputBorder()),
//               ),
//               SizedBox(height: 24),
//               TextFormField(
//                 initialValue: description,
//                 decoration: InputDecoration(
//                     hintText: description,
//                     labelText: "Description",
//                     border: OutlineInputBorder()),
//                 onChanged: (value) {
//                   setState(() {
//                     description = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 32),
//               Container(
//                 height: 48,
//                 width: Get.width,
//                 child: RaisedButton(
//                   padding: const EdgeInsets.all(8.0),
//                   textColor: Colors.white,
//                   color: Colors.blueGrey[400],
//                   child: new Text("ADD"),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100)),
//                   onPressed: () {
//                     // Navigator.pop(context);
//                   },
//                 ),
//               )
//             ],
//           ),
//         )));
//   }
// }
