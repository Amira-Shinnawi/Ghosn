import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';
import '../../data/customerModel.dart';
import 'widgets/mostSold.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        titleAppBar: Text(
          LocaleKeys.DashBoard.tr(),
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              FontAwesomeIcons.bars,
              size: 20,
            ),
          ),
        ],
      ),
      drawer: const AdminCustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 6, vertical: blockHeight * 3),
          child: ListView(shrinkWrap: true, children: [
            SizedBox(
              height: blockHeight * 20,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DashBoardFirstContainersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: blockWidth * 50,
                      height: blockHeight * 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              offset: Offset(0, 4),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  DashBoardFirstContainersList[index].text,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  DashBoardFirstContainersList[index].number,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                const Spacer(),
                                CircularPercentIndicator(
                                  radius: 40,
                                  progressColor: Colors.green,
                                  percent: .8,
                                  animation: true,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.TotalRevenue.tr(),
                    style: Styles.textStyle18Inter.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: blockWidth * 2,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                offset: Offset(0, 4))
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: SfCartesianChart(
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 40, interval: 10),
                        series: <CartesianSeries<SalesData, String>>[
                          ColumnSeries<SalesData, String>(
                              // Bind data source
                              dataSource: data,
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'Gold',
                              color: Color.fromRGBO(8, 142, 255, 1)),
                          ColumnSeries<SalesData, String>(
                            dataSource: data2,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: blockWidth * 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.ThisweekStatistic.tr(),
                  style: Styles.textStyle18Inter.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  LocaleKeys.RevenueandSales.tr(),
                ),
                SizedBox(
                  height: blockWidth * 2,
                ),
                SfCartesianChart(
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        // Bind data source
                        dataSource: data,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        name: 'Gold',
                        color: Color.fromRGBO(8, 142, 255, 1)),
                    LineSeries<SalesData, String>(
                      dataSource: data2,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black12,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Text(
                    LocaleKeys.MostSoldItems.tr(),
                    style: Styles.textStyle18Inter.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: mostSoldItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MostSold(
                              p: mostSoldItems[index].plantName,
                              i: mostSoldItems[index].value);
                        }),
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
