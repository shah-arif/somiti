import 'package:cloud_firestore/cloud_firestore.dart';

class QueryData {
  Future query_paid()async{
    final sepRef = await FirebaseFirestore.instance.collection("month/SEP/september");
    sepRef.where("isPaid",isEqualTo: true).get();
  }
  getPersonalPayment(){
    FirebaseFirestore.instance.collection("month/SEP/september").where("isPaid",isEqualTo: true).where("id",isEqualTo: 1).get().then((res) {
      print(res.docs.length);
    });
  }
}