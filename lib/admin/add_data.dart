import 'package:cloud_firestore/cloud_firestore.dart';

class AddData {
  final shaharif = {
    "name": "Shah Arif Abdullah",
    "isPaid": true,
    "id": 1
  };
  final tawsif = {
    "name": "Tawsif Abdullah",
    "isPaid": false,
    "id": 2
  };
  final shahadat = {
    "name": "Shahadat Hossain",
    "isPaid": false,
    "id": 3
  };
  final arman = {
    "name": "Md Arman",
    "isPaid": false,
    "id": 4
  };
  final jahed = {
    "name": "Jahedul Islam",
    "isPaid": false,
    "id": 5
  };
  final younus = {
    "name": "Md Younus",
    "isPaid": false,
    "id": 6
  };
  final minar = {
    "name": "Minarul Haque",
    "isPaid": false,
    "id": 7
  };
  //........................
  final W = {
    "name": "Mr W",
    "isPaid": false,
    "id": 8
  };
  final X = {
    "name": "Mr X",
    "isPaid": false,
    "id": 9
  };
  final Y = {
    "name": "Mr Y",
    "isPaid": false,
    "id": 10
  };
  final Z = {
    "name": "Mr Z",
    "isPaid": false,
    "id": 11
  };
  var db = FirebaseFirestore.instance;
  addData()async{
    db.collection("month/MAY/may").doc("1").set(shaharif);
    db.collection("month/JUN/june").doc("1").set(shaharif);
    db.collection("month/JUL/july").doc("1").set(shaharif);

    db.collection("month/MAY/may").doc("2").set(tawsif);
    db.collection("month/JUN/june").doc("2").set(tawsif);
    db.collection("month/JUL/july").doc("2").set(tawsif);

    db.collection("month/MAY/may").doc("3").set(shahadat);
    db.collection("month/JUN/june").doc("3").set(shahadat);
    db.collection("month/JUL/july").doc("3").set(shahadat);

    db.collection("month/MAY/may").doc("4").set(arman);
    db.collection("month/JUN/june").doc("4").set(arman);
    db.collection("month/JUL/july").doc("4").set(arman);

    db.collection("month/MAY/may").doc("5").set(jahed);
    db.collection("month/JUN/june").doc("5").set(jahed);
    db.collection("month/JUL/july").doc("5").set(jahed);

    db.collection("month/MAY/may").doc("6").set(younus);
    db.collection("month/JUN/june").doc("6").set(younus);
    db.collection("month/JUL/july").doc("6").set(younus);

    db.collection("month/MAY/may").doc("7").set(minar);
    db.collection("month/JUN/june").doc("7").set(minar);
    db.collection("month/JUL/july").doc("7").set(minar);

    db.collection("month/MAY/may").doc("8").set(W);
    db.collection("month/JUN/june").doc("8").set(W);
    db.collection("month/JUL/july").doc("8").set(W);

    db.collection("month/MAY/may").doc("9").set(X);
    db.collection("month/JUN/june").doc("9").set(X);
    db.collection("month/JUL/july").doc("9").set(X);

    db.collection("month/MAY/may").doc("10").set(Y);
    db.collection("month/JUN/june").doc("10").set(Y);
    db.collection("month/JUL/july").doc("10").set(Y);

    db.collection("month/MAY/may").doc("11").set(Z);
    db.collection("month/JUN/june").doc("11").set(Z);
    db.collection("month/JUL/july").doc("11").set(Z);
  }
}