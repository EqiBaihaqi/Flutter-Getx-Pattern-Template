// dummy_data.dart (Updated to match the image)
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/activity_card.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';

String getTimeAgo(DateTime dateTime) {
  final Duration diff = DateTime.now().difference(dateTime);

  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} seconds ago';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hours ago';
  } else {
    return '${diff.inDays} days ago';
  }
}

final List<ActivityCard> allActivities = [
  // Card 1: Raw Leads
  ActivityCard(
    type: ActivityCardType.transactionMonitoring,
    status: 'raw leads',
    descriptionButton: 'Detail Transaction',
    transactionDateTime: DateTime(2025, 7, 22),
    name: 'Asyraf darma',
    companyNameTransaction: 'PT Cipta Karya',
    businessScaleTransaction: 'Mikro',
    productType: 'Medical Device',
    uploadTimeTransaction:
        getTimeAgo(DateTime.now().subtract(const Duration(minutes: 2))),
    onTapDetail: () {
      Get.toNamed(Routes.DETAIL_TRANSACTION);
    },
  ),

  // Card 2: Potential Leads
  ActivityCard(
    type: ActivityCardType.transactionMonitoring,
    status: 'potential leads',
    descriptionButton: 'Detail Transaction',
    transactionDateTime: DateTime(2025, 7, 23),
    name: 'Rere Fitriani',
    companyNameTransaction: 'PT Cipta Karya',
    businessScaleTransaction: 'Mikro',
    productType: 'Medical Device',
    uploadTimeTransaction:
        getTimeAgo(DateTime.now().subtract(const Duration(minutes: 2))),
    onTapDetail: () {
      Get.toNamed(Routes.DETAIL_TRANSACTION);
    },
  ),

  // Card 3: Introduction
  ActivityCard(
    type: ActivityCardType.transactionMonitoring,
    status: 'introduction',
    descriptionButton: 'Detail Transaction',
    transactionDateTime: DateTime(2025, 7, 24),
    name: 'Putra Malik',
    companyNameTransaction: 'PT Cipta Karya',
    businessScaleTransaction: 'Mikro',
    productType: 'Medical Device',
    uploadTimeTransaction:
        getTimeAgo(DateTime.now().subtract(const Duration(minutes: 2))),
    onTapDetail: () {
      Get.toNamed(Routes.DETAIL_TRANSACTION);
    },
  ),

  // You can keep other data types here for other screens
  ActivityCard(
    type: ActivityCardType.transactionMonitoring,
    status: 'submitted',
    descriptionButton: 'Detail Transaction',
    transactionDateTime: DateTime(2025, 7, 25),
    companyNameTransaction: 'PT Maju Jaya',
    pic: 'Andi Saputra',
    businessScaleTransaction: 'Medium',
    uploadTimeTransaction:
        getTimeAgo(DateTime.now().subtract(const Duration(days: 1, hours: 3))),
    onTapDetail: () {
      Get.toNamed(Routes.DETAIL_TRANSACTION);
    },
  ),
];
