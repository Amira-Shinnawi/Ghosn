import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/style.dart';

class RecentShipmentTableBody extends StatelessWidget {
  const RecentShipmentTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return ListView(scrollDirection: Axis.horizontal, children: [
      SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Orders ID',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Customers',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Phone',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Driver',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Phone',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'To',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Status',
                style: Styles.textStyle16Inter,
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                style: Styles.textStyle16Inter,
              ),
            ),
          ],
          rows: List<DataRow>.generate(15, (index) {
            return DataRow(
              cells: [
                const DataCell(Text('#32000200')),
                const DataCell(Text('Priscilla Warren')),
                const DataCell(Text('01167399737')),
                const DataCell(Text('Shane Henry')),
                const DataCell(Text('01167399737')),
                const DataCell(Text('Cairo')),
                const DataCell(Text(
                  'Completed',
                  style: TextStyle(
                    color: kGreenColor,
                  ),
                )),
                DataCell(
                  Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        size: 20,
                        color: kGreenColor,
                      ),
                      SizedBox(
                        width: blockWidth * 1,
                      ),
                      const Icon(
                        Icons.delete,
                        size: 20,
                        color: kGreenColor,
                      ),
                      SizedBox(
                        width: blockWidth * 1,
                      ),
                      const Icon(
                        FontAwesomeIcons.ellipsis,
                        color: kGreenColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    ]);
  }
}
