import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/style.dart';

class LatestTransactionTableBody extends StatelessWidget {
  const LatestTransactionTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return ListView(scrollDirection: Axis.horizontal, children: [
      SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Description',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Transaction ID',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Type',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Card',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Date',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Amount',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Receipt',
                style: Styles.textStyle16Inter,
              ),
            ),
          ],
          rows: List<DataRow>.generate(15, (index) {
            return DataRow(
              cells: [
                DataCell(Row(
                  children: [
                    const Icon(
                      Icons.downloading_outlined,
                      color: Color(0xff718EBF),
                      size: 25,
                    ),
                    SizedBox(
                      width: blockWidth * 2,
                    ),
                    const Text('Emilly'),
                  ],
                )),
                const DataCell(Text('#12548796')),
                const DataCell(Text('Transfered')),
                const DataCell(Text('1234 ****')),
                const DataCell(Text('14 Jan, 10.40 PM')),
                const DataCell(Text(
                  '+\$840',
                  style: TextStyle(
                    color: kGreenColor,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataCell(Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: kGreenColor,
                        width: 1,
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockWidth * 3, vertical: blockHeight * .5),
                    child: const Text(
                      'Download',
                      style: TextStyle(
                        color: kGreenColor,
                      ),
                    ),
                  ),
                )),
              ],
            );
          }),
        ),
      ),
    ]);
  }
}
