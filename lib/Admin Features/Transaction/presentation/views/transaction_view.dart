import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';
import 'widgets/transaction_view_body.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        titleAppBar: Text(
          'Latest Transaction',
          style: Styles.textStyle20Inter.copyWith(
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
      body: const SafeArea(
        child: TransactionViewBody(),
      ),
    );
  }
}
