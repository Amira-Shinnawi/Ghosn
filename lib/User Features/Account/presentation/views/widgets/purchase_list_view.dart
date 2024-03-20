import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/purchase_item.dart';

class PurchasesListView extends StatelessWidget {
  const PurchasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PurchaseItem();
      },
    );
  }
}
