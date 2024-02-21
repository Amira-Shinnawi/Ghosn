import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/image 18.png"),
                  ),
                  const Spacer(),
                  const Text('سلة المشتريات', style: const TextStyle(fontSize: 20)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/image 27.png"),
                  ),
                ]),
              ),
            ),
            const Text('لا توجد عناصر حتى الآن',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 10.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 11.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 22.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 9.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 8.png"),
                ),
              ),
            ],
          ),
        ));
  }
}
