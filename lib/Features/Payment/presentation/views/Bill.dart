

import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_dash_line.dart';





class Bill extends StatelessWidget {
  Bill(
      {super.key,
      required this.address,
      required this.phoneNumber,
      required this.paymentMethod, required this.street
      });

  final String address;
  final String phoneNumber;
  final String paymentMethod;
  final String street;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: custom_appbar(title: "Payment Bill"),

      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(top: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
                padding:  EdgeInsets.all(20),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text("Thank You",
                              style: Styles.textStyle20Inter,
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text("Payment was completed successfully",
                            style: Styles.textStyle18Intergray,
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 32,
                        ),
                        dash_line(),
                        SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Paid Amount:",
                                textAlign: TextAlign.start,
                                style: Styles.textStyle20Inter,
                              ),
                              SizedBox(
                                height: 14.5,
                              ),
                              Text(
                                "123",
                                style: Styles.textStyle18Intergray,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Phone Number:",
                                style: Styles.textStyle20Inter,
                              ),
                              SizedBox(
                                height: 14.5,
                              ),
                              Text(
                                phoneNumber,
                                style: Styles.textStyle18Intergray,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Address:",
                                style: Styles.textStyle20Inter,
                              ),
                              SizedBox(
                                height: 14.5,
                              ),
                              Text(
                                address+ "-"+street,
                                style: Styles.textStyle18Intergray,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Name:",
                                style: Styles.textStyle20Inter,
                              ),
                              SizedBox(
                                height: 14.5,
                              ),
                              Text(
                                "esraa",
                                style: Styles.textStyle18Intergray,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  
                )),
            const Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFB1E98E),
                  radius: 40,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 75,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

