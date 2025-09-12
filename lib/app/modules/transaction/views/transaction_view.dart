import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction Monitoring',
          style: AppTextStyles.medium20,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.transactions.length,
        itemBuilder: (context, index) {
          // final transaction = controller.transactions[index];
          return controller.transactions[index];
        },
      ),
    );
  }
}
