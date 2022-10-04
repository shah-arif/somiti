import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:somiti/admin/add_data.dart';
import 'package:somiti/admin/query_data.dart';
import 'package:somiti/screens/overview.dart';
import 'package:somiti/screens/personal_info.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(initialPage: DateTime.now().month-1);

  final res = FirebaseFirestore.instance
      .collection("month/AUG/august")
      .where("isPaid")
      .snapshots()
      .length;

  @override
  Widget build(BuildContext context) {
    final monthStream = FirebaseFirestore.instance.collection("month").orderBy("position",descending: false).snapshots();

    final jan = FirebaseFirestore.instance.collection("month/JAN/january").orderBy("id", descending: false).snapshots();
    final feb = FirebaseFirestore.instance.collection("month/FEB/february").orderBy("id", descending: false).snapshots();
    final mar = FirebaseFirestore.instance.collection("month/MAR/march").orderBy("id", descending: false).snapshots();
    final apr = FirebaseFirestore.instance.collection("month/APR/april").orderBy("id", descending: false).snapshots();
    final may = FirebaseFirestore.instance.collection("month/MAY/may").orderBy("id", descending: false).snapshots();
    final jun = FirebaseFirestore.instance.collection("month/JUN/june").orderBy("id", descending: false).snapshots();
    final jul = FirebaseFirestore.instance.collection("month/JUL/july").orderBy("id", descending: false).snapshots();
    final aug = FirebaseFirestore.instance.collection("month/AUG/august").orderBy("id", descending: false).snapshots();
    final sep = FirebaseFirestore.instance.collection("month/SEP/september").orderBy("id", descending: false).snapshots();
    final oct = FirebaseFirestore.instance.collection("month/OCT/october").orderBy("id", descending: false).snapshots();
    final nov = FirebaseFirestore.instance.collection("month/NOV/november").orderBy("id", descending: false).snapshots();
    final dec = FirebaseFirestore.instance.collection("month/DEC/december").orderBy("id", descending: false).snapshots();
    final streamList = [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec];
    return Scaffold(
      appBar: AppBar(title: const Text("YFC"), centerTitle: true,
          actions: [IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Overview()));
      }, icon: Icon(CupertinoIcons.forward))]
      ),
      drawer: const DrawerScreen(),
      body: Center(
        child: StreamBuilder(
            stream: monthStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> monthSnapshot) {
              if (monthSnapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (monthSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      color: Colors.blueGrey,
                      child: SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Balance",
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        StreamBuilder(
                                          stream: FirebaseFirestore.instance.collection("month/AUG/august").where("isPaid",isEqualTo: true).snapshots(),
                                            builder: (context,AsyncSnapshot<QuerySnapshot>augSnapshot){
                                              if (augSnapshot.hasError) {
                                                return const Center(child: Text("Something went wrong"));
                                              }
                                              if (augSnapshot.connectionState == ConnectionState.waiting) {
                                                return const Center(child: CircularProgressIndicator());
                                              }
                                            return StreamBuilder(
                                              stream: FirebaseFirestore.instance.collection("month/SEP/september").where("isPaid",isEqualTo: true).snapshots(),
                                                builder: (context,AsyncSnapshot<QuerySnapshot>sepSnapshot){
                                                  if (sepSnapshot.hasError) {
                                                    return const Center(child: Text("Something went wrong"));
                                                  }
                                                  if (sepSnapshot.connectionState == ConnectionState.waiting) {
                                                    return const Center(child: CircularProgressIndicator());
                                                  }
                                                  return StreamBuilder(
                                                      stream: FirebaseFirestore.instance.collection("month/OCT/october").where("isPaid",isEqualTo: true).snapshots(),
                                                      builder: (context,AsyncSnapshot<QuerySnapshot>octSnapshot){
                                                        if (octSnapshot.hasError) {
                                                          return const Center(child: Text("Something went wrong"));
                                                        }
                                                        if (octSnapshot.connectionState == ConnectionState.waiting) {
                                                          return const Center(child: CircularProgressIndicator());
                                                        }
                                                        return StreamBuilder(
                                                            stream: FirebaseFirestore.instance.collection("month/NOV/november").where("isPaid",isEqualTo: true).snapshots(),
                                                            builder: (context,AsyncSnapshot<QuerySnapshot>novSnapshot){
                                                              if (novSnapshot.hasError) {
                                                                return const Center(child: Text("Something went wrong"));
                                                              }
                                                              if (novSnapshot.connectionState == ConnectionState.waiting) {
                                                                return const Center(child: CircularProgressIndicator());
                                                              }
                                                              return StreamBuilder(
                                                                  stream: FirebaseFirestore.instance.collection("month/DEC/december").where("isPaid",isEqualTo: true).snapshots(),
                                                                  builder: (context,AsyncSnapshot<QuerySnapshot>decSnapshot){
                                                                    if (decSnapshot.hasError) {
                                                                      return const Center(child: Text("Something went wrong"));
                                                                    }
                                                                    if (decSnapshot.connectionState == ConnectionState.waiting) {
                                                                      return const Center(child: CircularProgressIndicator());
                                                                    }
                                                                    return StreamBuilder(
                                                                        stream: FirebaseFirestore.instance.collection("month/JAN/january").where("isPaid",isEqualTo: true).snapshots(),
                                                                        builder: (context,AsyncSnapshot<QuerySnapshot>janSnapshot){
                                                                          if (janSnapshot.hasError) {
                                                                            return const Center(child: Text("Something went wrong"));
                                                                          }
                                                                          if (janSnapshot.connectionState == ConnectionState.waiting) {
                                                                            return const Center(child: CircularProgressIndicator());
                                                                          }
                                                                          return StreamBuilder(
                                                                              stream: FirebaseFirestore.instance.collection("month/FEB/february").where("isPaid",isEqualTo: true).snapshots(),
                                                                              builder: (context,AsyncSnapshot<QuerySnapshot>febSnapshot){
                                                                                if (febSnapshot.hasError) {
                                                                                  return const Center(child: Text("Something went wrong"));
                                                                                }
                                                                                if (febSnapshot.connectionState == ConnectionState.waiting) {
                                                                                  return const Center(child: CircularProgressIndicator());
                                                                                }
                                                                                return StreamBuilder(
                                                                                    stream: FirebaseFirestore.instance.collection("month/MAR/march").where("isPaid",isEqualTo: true).snapshots(),
                                                                                    builder: (context,AsyncSnapshot<QuerySnapshot>marSnapshot){
                                                                                      if (marSnapshot.hasError) {
                                                                                        return const Center(child: Text("Something went wrong"));
                                                                                      }
                                                                                      if (marSnapshot.connectionState == ConnectionState.waiting) {
                                                                                        return const Center(child: CircularProgressIndicator());
                                                                                      }
                                                                                      return StreamBuilder(
                                                                                          stream: FirebaseFirestore.instance.collection("month/APR/april").where("isPaid",isEqualTo: true).snapshots(),
                                                                                          builder: (context,AsyncSnapshot<QuerySnapshot>aprSnapshot){
                                                                                            if (aprSnapshot.hasError) {
                                                                                              return const Center(child: Text("Something went wrong"));
                                                                                            }
                                                                                            if (aprSnapshot.connectionState == ConnectionState.waiting) {
                                                                                              return const Center(child: CircularProgressIndicator());
                                                                                            }
                                                                                            return StreamBuilder(
                                                                                                stream: FirebaseFirestore.instance.collection("month/MAY/may").where("isPaid",isEqualTo: true).snapshots(),
                                                                                                builder: (context,AsyncSnapshot<QuerySnapshot>maySnapshot){
                                                                                                  if (maySnapshot.hasError) {
                                                                                                    return const Center(child: Text("Something went wrong"));
                                                                                                  }
                                                                                                  if (maySnapshot.connectionState == ConnectionState.waiting) {
                                                                                                    return const Center(child: CircularProgressIndicator());
                                                                                                  }
                                                                                                  return StreamBuilder(
                                                                                                      stream: FirebaseFirestore.instance.collection("month/JUN/june").where("isPaid",isEqualTo: true).snapshots(),
                                                                                                      builder: (context,AsyncSnapshot<QuerySnapshot>junSnapshot){
                                                                                                        if (junSnapshot.hasError) {
                                                                                                          return const Center(child: Text("Something went wrong"));
                                                                                                        }
                                                                                                        if (junSnapshot.connectionState == ConnectionState.waiting) {
                                                                                                          return const Center(child: CircularProgressIndicator());
                                                                                                        }
                                                                                                        return StreamBuilder(
                                                                                                            stream: FirebaseFirestore.instance.collection("month/JUL/july").where("isPaid",isEqualTo: true).snapshots(),
                                                                                                            builder: (context,AsyncSnapshot<QuerySnapshot>julSnapshot){
                                                                                                              if (julSnapshot.hasError) {
                                                                                                                return const Center(child: Text("Something went wrong"));
                                                                                                              }
                                                                                                              if (julSnapshot.connectionState == ConnectionState.waiting) {
                                                                                                                return const Center(child: CircularProgressIndicator());
                                                                                                              }
                                                                                                               return Text(
                                                                                                                "BDT "+((
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
                                                                                                                    color: Colors.white, fontSize: 30),
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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        Text(
                                          "Date",
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        Text(
                                          DateFormat("dd MMMM yyyy").format(DateTime.now()),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        itemCount: streamList.length,
                        itemBuilder: (context, pageIndex) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                    color: Colors.green,
                                    elevation: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 30,
                                          right: 30),
                                      child: Text(
                                        monthSnapshot.data!.docs[pageIndex]
                                            ["name"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                // Text(monthSnapshot.data!.docs[pageIndex]["name"]),
                                StreamBuilder(
                                    stream: streamList[pageIndex],
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot>
                                            detailSnapshot) {
                                      if (detailSnapshot.hasError) {
                                        return const Text(
                                            "Something went wrong");
                                      }
                                      if (detailSnapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }
                                      return
                                          // Text(detailSnapshot.data!.docs[0]["name"].toString());
                                          Expanded(
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                            itemCount: detailSnapshot
                                                .data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Text("#"+detailSnapshot
                                                    .data!.docs[index]["id"]
                                                    .toString()),
                                                title: InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfo(detailSnapshot.data!.docs[index]["name"],index+1)));
                                                  },
                                                  child: Text(detailSnapshot
                                                      .data!.docs[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                                                ),
                                                // subtitle: Text(snapshot.data!.docs[index]["id"].toString()),
                                                trailing: detailSnapshot.data!
                                                                .docs[index]
                                                            ["isPaid"] ==
                                                        true
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                      )
                                                    : const Icon(
                                                        Icons.circle_outlined),
                                              );
                                            }),
                                      );
                                    }),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // QueryData().getPersonalPayment();
      //   // AddData().addData();
      // }),
    );
  }
}
