import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../admin/admin.dart';


class AdminControlScreen extends StatefulWidget {
  const AdminControlScreen({Key? key}) : super(key: key);

  @override
  State<AdminControlScreen> createState() => _AdminControlScreenState();
}

enum SigningCharacter { paid, unpaid}

class _AdminControlScreenState extends State<AdminControlScreen> {




  SigningCharacter? _character = SigningCharacter.unpaid;

  int pressedAttentionIndex  = DateTime.now().month-1;
  int streamIndex = DateTime.now().month-1;
  String text = "no data found";
  List monthNameList = ["January","February","March","April","May","June","July","August","September","October","November","December",];
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController idController = TextEditingController();
    bool isPaid = false;

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

    final monthStream = FirebaseFirestore.instance.collection("month").orderBy("position",descending: false).snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Control"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.10-8,
              // color: Colors.green,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: monthNameList.length,
                  itemBuilder: (context,index){
                    final pressAttention = pressedAttentionIndex == index;
                return InkWell(
                  onTap: (){
                    setState(() {
                      streamIndex = index;
                      pressedAttentionIndex = index;
                      print(streamIndex);
                    });
                    print("clicked ${monthNameList[index]}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      elevation: 5,
                      color: pressAttention ? Colors.red : Colors.green,
                      child: Container(
                          child: RotatedBox(
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Center(child: Text(monthNameList[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                            ),
                            quarterTurns: -1,
                          )
                      ),
                    ),
                  ),
                );
              }),
            ),
            VerticalDivider(thickness: 1,),
            Container(
              width: MediaQuery.of(context).size.width*0.90-24,
              child: Center(
                child: StreamBuilder(
                  stream: streamList[streamIndex],
                    builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                      if(snapshot.hasError){
                        return Text("Something went wrong");
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      return ListView.builder(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                        return ListTile(
                          leading: Text("#"+snapshot.data!.docs[index]["id"].toString()),
                          title: Text(snapshot.data!.docs[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(onTap: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
                                        return Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(snapshot.data!.docs[index]["name"].toString(),style: TextStyle(fontSize: 30),),
                                                        StreamBuilder(
                                                            stream: monthStream,
                                                            builder: (context,AsyncSnapshot<QuerySnapshot>monthSnapshot){
                                                              if(monthSnapshot.hasError){
                                                                return Text("Something went wrong");
                                                              }
                                                              if(monthSnapshot.connectionState == ConnectionState.waiting){
                                                                return CircularProgressIndicator();
                                                              }
                                                              return Text(monthSnapshot.data!.docs[streamIndex]["name"],style: TextStyle(color: Colors.blueGrey),);
                                                            }),
                                                      ],
                                                    ),
                                                    IconButton(onPressed: (){
                                                      showDialog(context: context, builder: (context){
                                                        return AlertDialog(
                                                          content: Container(
                                                            height: 150,
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text("Are you sure you want to delete?"),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      TextButton(onPressed: (){
                                                                        Navigator.pop(context);
                                                                      }, child: Text("No")),
                                                                      TextButton(onPressed: (){
                                                                        Admin().deleteStatusMonthly(snapshot.data!.docs[index]["id"].toString(), streamIndex);
                                                                        Navigator.pop(context);
                                                                        Navigator.pop(context);
                                                                      }, child: Text("Yes")),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });

                                                    },tooltip: "Delete", icon: Icon(Icons.delete,size: 30,),color: Colors.red,),
                                                  ],
                                                ),
                                                Divider(thickness: 1),
                                                SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Text("Is Paid ?",style: TextStyle(fontWeight: FontWeight.bold)),
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(primary: snapshot.data!.docs[index]["isPaid"] == true ? Colors.green : Colors.grey),
                                                            onPressed: () {
                                                              Admin().updateStatusMonthly((snapshot.data!.docs[index]["id"]).toString(), true,streamIndex);
                                                              Navigator.pop(context);
                                                              setState(() {

                                                              },);
                                                            },

                                                            child: Text("Yes",style: TextStyle(color: Colors.white))),
                                                        SizedBox(width: 5,),
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(primary: snapshot.data!.docs[index]["isPaid"] == true ? Colors.grey :
                                                            Colors.red),
                                                            onPressed: () {
                                                              Admin().updateStatusMonthly((snapshot.data!.docs[index]["id"]).toString(), false,streamIndex);
                                                              Navigator.pop(context);
                                                              setState(() {

                                                              },);
                                                            },

                                                            child: Text("No",style: TextStyle(color: Colors.white),)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("EDIT",style: TextStyle(color: Colors.blueGrey),),
                              )),
                              SizedBox(width: 8,),
                              snapshot.data!.docs[index]["isPaid"] ==
                                  true
                                  ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                                  : const Icon(
                                  Icons.circle_outlined),
                            ],
                          )
                        );
                      });
                    }
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
            context: context, builder: (context){
          return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
            return Padding(
                padding: MediaQuery.of(context).viewInsets*0.75,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add user in ${monthNameList[streamIndex]}"),
                      TextField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: idController,
                        decoration: InputDecoration(
                          hintText: "Id",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                                title: Text("Paid"),
                                leading: Radio(
                                    value: SigningCharacter.paid,
                                    groupValue: _character,
                                    onChanged: (SigningCharacter? value){
                                      setState(() {
                                        _character = value;
                                        isPaid = true;
                                      });
                                    }
                                )
                            ),
                            ListTile(
                                title: Text("Unpaid"),
                                leading: Radio(
                                    value: SigningCharacter.unpaid,
                                    groupValue: _character,
                                    onChanged: (SigningCharacter? value){
                                      setState(() {
                                        _character = value;
                                        isPaid = false;
                                      });
                                    }
                                )
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        monthRefList[streamIndex].doc(idController.text).set({
                          "name": _nameController.text,
                          "id": int.parse(idController.text),
                          "isPaid": isPaid,
                        });
                      }, child: Text("Add User"))

                    ],
                  ),
                ),

              ),
            );
          });
        });
      },child: Icon(Icons.add),),
    );
  }
}
