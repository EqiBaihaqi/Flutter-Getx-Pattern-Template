import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/activity_card.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/models/transaction_dummy_model.dart';

class TransactionController extends GetxController {
  // A reactive list that will hold the filtered ActivityCard WIDGETS
  final RxList<ActivityCard> transactions = <ActivityCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactionData();
  }

  void loadTransactionData() {
    // Filter your widget list to get only the cards with the correct type
    final filteredList = allActivities
        .where((activityCardWidget) =>
            activityCardWidget.type == ActivityCardType.transactionMonitoring)
        .toList();

    // Assign the filtered list of widgets to our reactive variable
    transactions.assignAll(filteredList);
  }
}
