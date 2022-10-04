import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somiti/admin/admin.dart';

class AdminControl extends StatelessWidget {
  const AdminControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final monthStream =
    FirebaseFirestore.instance.collection("month").snapshots();
    final stream1 =
    FirebaseFirestore.instance.collection("month/AUG/august").orderBy("id",descending: false).snapshots();
    final stream2 = FirebaseFirestore.instance
        .collection("month/SEP/september").orderBy("id",descending: false)
        .snapshots();
    final streamList = [stream1,stream2];
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Control"),
        ),
        body: Center(
          child: StreamBuilder(
              stream: monthStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> monthSnapshot) {
                if (monthSnapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                if (monthSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return PageView.builder(
                    itemCount: monthSnapshot.data!.docs.length,
                    itemBuilder: (context, pageIndex) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(color: Colors.green,elevation: 6,child: Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 30,right: 30),
                              child: Text(monthSnapshot.data!.docs[pageIndex]["name"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                            // Text(monthSnapshot.data!.docs[pageIndex]["name"]),
                            StreamBuilder(
                                stream: streamList[pageIndex],
                                builder: (context,AsyncSnapshot<QuerySnapshot>detailSnapshot){
                                  if(detailSnapshot.hasError){
                                    return Text("Something went wrong");
                                  }
                                  if (detailSnapshot.connectionState == ConnectionState.waiting){
                                    return CircularProgressIndicator();
                                  }
                                  return
                                    // Text(detailSnapshot.data!.docs[0]["name"].toString());
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: detailSnapshot.data!.docs.length,
                                          itemBuilder: (context,index){
                                            return ListTile(
                                              leading: Text(detailSnapshot.data!.docs[index]["id"].toString()),
                                              title: Text(detailSnapshot.data!.docs[index]["name"]),
                                              subtitle: Align(
                                                alignment: Alignment.centerRight,
                                                child: InkWell(onTap: (){
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(16),
                                                            child: Column(
                                                              children: [
                                                                Text(detailSnapshot.data!.docs[index]["name"].toString(),style: TextStyle(fontSize: 30),),
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
                                                                        TextButton(
                                                                            onPressed: ()=>
                                                                                Admin().updateStatusMonthly((index + 1).toString(), true,pageIndex),

                                                                            child: Text("Yes",style: TextStyle(color: Colors.green))),
                                                                        TextButton(
                                                                            onPressed: ()=>
                                                                                Admin().updateStatusMonthly((index + 1).toString(), false,pageIndex),

                                                                            child: Text("No",style: TextStyle(color: Colors.red),)),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("EDIT"),
                                                )),
                                              ),
                                              trailing: detailSnapshot.data!.docs[index]["isPaid"] == true
                                                  ? Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                                  : Icon(Icons.circle_outlined),
                                            );
                                          }),
                                    );
                                }),
                          ],
                        ),
                      );
                    });
              }),
        ),
    );
  }
}
