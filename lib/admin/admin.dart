import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  updateStatusMonthly(String id, bool isPaid,int refIndex){
    final janRef = FirebaseFirestore.instance.collection("month/JAN/january");
    final febRef = FirebaseFirestore.instance.collection("month/FEB/february");
    final marRef = FirebaseFirestore.instance.collection("month/MAR/march");
    final aprRef = FirebaseFirestore.instance.collection("month/APR/april");
    final mayRef = FirebaseFirestore.instance.collection("month/MAY/may");
    final junRef = FirebaseFirestore.instance.collection("month/JUN/june");
    final julRef = FirebaseFirestore.instance.collection("month/JUL/july");
    final augRef = FirebaseFirestore.instance.collection("month/AUG/august");
    final sepRef = FirebaseFirestore.instance.collection("month/SEP/september");
    final octRef = FirebaseFirestore.instance.collection("month/OCT/october");
    final novRef = FirebaseFirestore.instance.collection("month/NOV/november");
    final decRef = FirebaseFirestore.instance.collection("month/DEC/december");
    final monthRefList = [janRef, febRef, marRef, aprRef, mayRef, junRef, julRef, augRef, sepRef, octRef, novRef, decRef];
    monthRefList[refIndex].doc(id).update({'isPaid':isPaid});
  }

  deleteStatusMonthly(String id,int refIndex){
    final janRef = FirebaseFirestore.instance.collection("month/JAN/january");
    final febRef = FirebaseFirestore.instance.collection("month/FEB/february");
    final marRef = FirebaseFirestore.instance.collection("month/MAR/march");
    final aprRef = FirebaseFirestore.instance.collection("month/APR/april");
    final mayRef = FirebaseFirestore.instance.collection("month/MAY/may");
    final junRef = FirebaseFirestore.instance.collection("month/JUN/june");
    final julRef = FirebaseFirestore.instance.collection("month/JUL/july");
    final augRef = FirebaseFirestore.instance.collection("month/AUG/august");
    final sepRef = FirebaseFirestore.instance.collection("month/SEP/september");
    final octRef = FirebaseFirestore.instance.collection("month/OCT/october");
    final novRef = FirebaseFirestore.instance.collection("month/NOV/november");
    final decRef = FirebaseFirestore.instance.collection("month/DEC/december");
    final monthRefList = [janRef, febRef, marRef, aprRef, mayRef, junRef, julRef, augRef, sepRef, octRef, novRef, decRef];
    monthRefList[refIndex].doc(id).delete();
  }
}