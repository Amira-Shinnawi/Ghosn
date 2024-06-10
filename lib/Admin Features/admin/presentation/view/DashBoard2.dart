import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/customerModel.dart';
import '../widgets/mostSold.dart';


class dashBoard2 extends StatefulWidget {
  @override
  State<dashBoard2> createState() => _dashBoard2State();
}

class _dashBoard2State extends State<dashBoard2> {
  @override
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true,children: [SizedBox(height: 100,width:double.infinity,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: DashBoardFirstContainersList.length,itemBuilder: (BuildContext context, int index){return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( width: 170,                             height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black12,
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [Row(
            children: [
              Text(DashBoardFirstContainersList[index].text,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.grey,
                  decoration: TextDecoration.none),),
            ],
          ),Row(
            children: [
              Text(DashBoardFirstContainersList[index].number,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.black,
                  decoration: TextDecoration.none),),Spacer(),CircularPercentIndicator(
                radius: 50,
                progressColor: Colors.green,
                percent: .8,
                animation: true,
              )
            ],
          )],),
        ),),
    );},),),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black12,
                offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(20)),
          child: SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
              series: <CartesianSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  // Bind data source
                    dataSource:  data,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                , name: 'Gold',
      color: Color.fromRGBO(8, 142, 255, 1)),ColumnSeries<SalesData, String>(            dataSource: data2,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
          )
      ),
    ),Container(child: SfCartesianChart(
      // Initialize category axis
      primaryXAxis: CategoryAxis(),

      series:<LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
          // Bind data source
            dataSource:  data,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales
            , name: 'Gold',
            color: Color.fromRGBO(8, 142, 255, 1)),LineSeries<SalesData, String>(            dataSource: data2,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
        ),
      ],
    )),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black12,
                offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(20)),
        child: Column(children:[Text('most sold items',style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13,
            color: Colors.black,
            decoration: TextDecoration.none),),Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(shrinkWrap: true,itemCount:mostSoldItems.length,itemBuilder:  (BuildContext context, int index){return MostSold(p:mostSoldItems[index].plantName,i:mostSoldItems[index].value);}),
        )]),
      ),
    )]);}
}
