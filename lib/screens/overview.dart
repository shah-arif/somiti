import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}
var nameList = [];
var name;
Future getName()async{
await FirebaseFirestore.instance.collection("month/AUG/august").orderBy("id",descending: false).get().then(
        (res) => res.docs.forEach((document) {
    nameList.add(document["name"]);
  }));

}


class _OverviewState extends State<Overview> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    getName();


    data = [
      _ChartData(nameList[0], 8*200.toDouble()),
      _ChartData(nameList[1], 7*200.toDouble()),
      _ChartData(nameList[2], 6*200.toDouble()),
      // _ChartData('RUS', 30),
      // _ChartData('BRZ', 6.4),
      // _ChartData('IND', 14),
      // _ChartData('BAN', 16),
      // _ChartData('JAP', 14),
      // _ChartData('CAN', 38),
      // _ChartData('USA', 45),
      // _ChartData('PAK', 14),
      // _ChartData('NUZ', 42),
      // _ChartData('POR', 8.5),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 3000, interval: 200),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
              borderRadius: BorderRadius.circular(5),
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Gold',
                color: Color.fromRGBO(8, 142, 255, 1))
          ]),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   // getName();
      // }),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

