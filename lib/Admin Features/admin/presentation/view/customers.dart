import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';
import '../../data/customerModel.dart';
import 'widgets/circularPercentIndicator.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        titleAppBar: Text(
          LocaleKeys.Customers.tr(),
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                LocaleKeys.Customers.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                              const Spacer(),
                              Image.asset('assets/images/Group 9.png')
                            ],
                          ),
                          Text(
                            LocaleKeys.informationaboutyourcustomer.tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Percent(
                                  i: customersPercentage[0],
                                  p: customersPercentageV[0]),
                              Text(
                                LocaleKeys.currentcustomers.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Percent(
                                  i: customersPercentage[1],
                                  p: customersPercentageV[1]),
                              Text(
                                LocaleKeys.currentcustomers.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Percent(
                                  i: customersPercentage[2],
                                  p: customersPercentageV[2]),
                              Text(
                                LocaleKeys.currentcustomers.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Percent(
                                  i: customersPercentage[3],
                                  p: customersPercentageV[3]),
                              Text(
                                LocaleKeys.currentcustomers.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          LocaleKeys.stateoverview.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        const Spacer(),
                        Image.asset('assets/images/Group 9.png')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.informationaboutstorevisits.tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.Women.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 5),
                      child: LinearPercentIndicator(
                        lineHeight: 10,
                        percent: .5,
                        animation: true,
                        progressColor: Colors.orange,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.Men.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 5),
                      child: LinearPercentIndicator(
                        lineHeight: 10,
                        percent: .8,
                        animation: true,
                        progressColor: Colors.green,
                      ),
                    )
                  ]),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black12,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: CurrentCustomers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                                radius:
                                    15, // Adjust the radius according to your preference
                                backgroundImage: AssetImage(
                                    CurrentCustomers[index].profilePic)),
                            Text(
                              CurrentCustomers[index].userName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
