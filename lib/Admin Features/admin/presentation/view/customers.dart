import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../data/customerModel.dart';
import '../widgets/circularPercentIndicator.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const[
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
                            const Text(
                              'Customers',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                            const Spacer(),
                            Image.asset('assets/images/Group 9.png')
                          ],
                        ),
                        const Text(
                          'information about your customer',
                          style: TextStyle(
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
                            const Text(
                              'current customers',
                              style: TextStyle(
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
                            const Text(
                              'current customers',
                              style: TextStyle(
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
                            const Text(
                              'current customers',
                              style: TextStyle(
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
                            const  Text(
                              'current customers',
                              style: TextStyle(
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
                  boxShadow: const[
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
                      const Text(
                        'state overview',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      const  Spacer(),
                      Image.asset('assets/images/Group 9.png')
                    ],
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(bottom: 20),
                    child:  Row(
                      children: [
                         Text(
                          'information about store visits ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                       Text(
                        'Women',
                        style: TextStyle(
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
                  const Row(
                    children: [
                       Text(
                        'Men',
                        style: TextStyle(
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
                  boxShadow: const[
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
                            style:const TextStyle(
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
    );
  }
}
