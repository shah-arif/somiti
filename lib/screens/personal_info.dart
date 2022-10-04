import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  final getname;
  final getId;
   PersonalInfo(this.getname,this.getId);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState(this.getname,this.getId);
}

class _PersonalInfoState extends State<PersonalInfo> {
  var name;
  var id;
  _PersonalInfoState(this.name,this.id);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Info"),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8,
              // color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                  Text("id : "+id.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("month/AUG/august").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                      builder: (context,AsyncSnapshot<QuerySnapshot>augSnapshot){
                        if (augSnapshot.hasError) {
                          return const Center(child: Text("Something went wrong"));
                        }
                        if (augSnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("month/SEP/september").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                            builder: (context,AsyncSnapshot<QuerySnapshot>sepSnapshot){
                              if (sepSnapshot.hasError) {
                                return const Center(child: Text("Something went wrong"));
                              }
                              if (sepSnapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection("month/OCT/october").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                  builder: (context,AsyncSnapshot<QuerySnapshot>octSnapshot){
                                    if (octSnapshot.hasError) {
                                      return const Center(child: Text("Something went wrong"));
                                    }
                                    if (octSnapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    return StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection("month/NOV/november").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                        builder: (context,AsyncSnapshot<QuerySnapshot>novSnapshot){
                                          if (novSnapshot.hasError) {
                                            return const Center(child: Text("Something went wrong"));
                                          }
                                          if (novSnapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(child: CircularProgressIndicator());
                                          }
                                          return StreamBuilder(
                                              stream: FirebaseFirestore.instance.collection("month/DEC/december").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                              builder: (context,AsyncSnapshot<QuerySnapshot>decSnapshot){
                                                if (decSnapshot.hasError) {
                                                  return const Center(child: Text("Something went wrong"));
                                                }
                                                if (decSnapshot.connectionState == ConnectionState.waiting) {
                                                  return const Center(child: CircularProgressIndicator());
                                                }
                                                return StreamBuilder(
                                                    stream: FirebaseFirestore.instance.collection("month/JAN/january").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                    builder: (context,AsyncSnapshot<QuerySnapshot>janSnapshot){
                                                      if (janSnapshot.hasError) {
                                                        return const Center(child: Text("Something went wrong"));
                                                      }
                                                      if (janSnapshot.connectionState == ConnectionState.waiting) {
                                                        return const Center(child: CircularProgressIndicator());
                                                      }
                                                      return StreamBuilder(
                                                          stream: FirebaseFirestore.instance.collection("month/FEB/february").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                          builder: (context,AsyncSnapshot<QuerySnapshot>febSnapshot){
                                                            if (febSnapshot.hasError) {
                                                              return const Center(child: Text("Something went wrong"));
                                                            }
                                                            if (febSnapshot.connectionState == ConnectionState.waiting) {
                                                              return const Center(child: CircularProgressIndicator());
                                                            }
                                                            return StreamBuilder(
                                                                stream: FirebaseFirestore.instance.collection("month/MAR/march").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                                builder: (context,AsyncSnapshot<QuerySnapshot>marSnapshot){
                                                                  if (marSnapshot.hasError) {
                                                                    return const Center(child: Text("Something went wrong"));
                                                                  }
                                                                  if (marSnapshot.connectionState == ConnectionState.waiting) {
                                                                    return const Center(child: CircularProgressIndicator());
                                                                  }
                                                                  return StreamBuilder(
                                                                      stream: FirebaseFirestore.instance.collection("month/APR/april").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                                      builder: (context,AsyncSnapshot<QuerySnapshot>aprSnapshot){
                                                                        if (aprSnapshot.hasError) {
                                                                          return const Center(child: Text("Something went wrong"));
                                                                        }
                                                                        if (aprSnapshot.connectionState == ConnectionState.waiting) {
                                                                          return const Center(child: CircularProgressIndicator());
                                                                        }
                                                                        return StreamBuilder(
                                                                            stream: FirebaseFirestore.instance.collection("month/MAY/may").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                                            builder: (context,AsyncSnapshot<QuerySnapshot>maySnapshot){
                                                                              if (maySnapshot.hasError) {
                                                                                return const Center(child: Text("Something went wrong"));
                                                                              }
                                                                              if (maySnapshot.connectionState == ConnectionState.waiting) {
                                                                                return const Center(child: CircularProgressIndicator());
                                                                              }
                                                                              return StreamBuilder(
                                                                                  stream: FirebaseFirestore.instance.collection("month/JUN/june").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                                                  builder: (context,AsyncSnapshot<QuerySnapshot>junSnapshot){
                                                                                    if (junSnapshot.hasError) {
                                                                                      return const Center(child: Text("Something went wrong"));
                                                                                    }
                                                                                    if (junSnapshot.connectionState == ConnectionState.waiting) {
                                                                                      return const Center(child: CircularProgressIndicator());
                                                                                    }
                                                                                    return StreamBuilder(
                                                                                        stream: FirebaseFirestore.instance.collection("month/JUL/july").where("isPaid",isEqualTo: true).where("id",isEqualTo: id).snapshots(),
                                                                                        builder: (context,AsyncSnapshot<QuerySnapshot>julSnapshot){
                                                                                          if (julSnapshot.hasError) {
                                                                                            return const Center(child: Text("Something went wrong"));
                                                                                          }
                                                                                          if (julSnapshot.connectionState == ConnectionState.waiting) {
                                                                                            return const Center(child: CircularProgressIndicator());
                                                                                          }
                                                                                          return
                                                                                            Text(
                                                                                              "Total "+((
                                                                                                  augSnapshot.data!.docs.length
                                                                                                      +sepSnapshot.data!.docs.length
                                                                                                      +octSnapshot.data!.docs.length
                                                                                                      +novSnapshot.data!.docs.length
                                                                                                      +decSnapshot.data!.docs.length
                                                                                                      +janSnapshot.data!.docs.length
                                                                                                      +febSnapshot.data!.docs.length
                                                                                                      +marSnapshot.data!.docs.length
                                                                                                      +aprSnapshot.data!.docs.length
                                                                                                      +maySnapshot.data!.docs.length
                                                                                                      +junSnapshot.data!.docs.length
                                                                                                      +julSnapshot.data!.docs.length
                                                                                              )*200).toString(),
                                                                                              style: TextStyle(
                                                                                                  fontSize: 30,fontWeight: FontWeight.bold),
                                                                                            );
                                                                                        }
                                                                                    );
                                                                                  }
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            );
                                                          }
                                                      );
                                                    }
                                                );
                                              }
                                          );
                                        }
                                    );
                                  }
                              );
                            });
                      }
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
