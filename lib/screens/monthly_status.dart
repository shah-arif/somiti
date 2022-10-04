// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class MonthlyStatus extends StatelessWidget {
//   String name;
//   String isPaid;
//   MonthlyStatus({required this.name, required this.isPaid});
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> august_status =
//       FirebaseFirestore.instance.collection("august_status").snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: august_status,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           final length = snapshot.data!.docs.length;
//           print(length);
//           if (snapshot.hasError) {
//             return Center(child: Text("Something went wrong"));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               leading: Text(document.id),
//               title: Text(snapshot.data!.docs[5]["name"].toString()),
//               trailing: data[isPaid] == true
//                   ? Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                     )
//                   : Icon(Icons.circle_outlined),
//             );
//           }).toList());
//         });
//   }
// }
